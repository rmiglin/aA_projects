class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true 

    # USER AUTH METHODS

    validates :password_digest, presence: { message: 'Password can\'t be blank'}
    validates :session_token, presence: true, uniqueness: true

    # validation uses #password getter, which is why we added attr_reader for password
    # if there is a @password (e.g. when creating a new user, where we explicity set a password using our #password= setter), length must be at least 6
    # allow_nil => allow validation to pass if @password is nil, as happens when we're saving/updating a user that we pulled from database (only password_digest stored in db)
    validates :password, length: { minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email) # finds a user, else returns nil
        return nil unless user && user.is_password?(password) # is_password? only executes if user is a User object (was found), not nil
        user
    end

    # set both @password and self.password_digest
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
        # BCrypt::Password::new vs BCrypt::Password::create
            # `create` takes a plaintext password, hashes and salts it, and spits out a digest
            # `new` just converts a password_digest string into an instance of  BCrypt::Password so that we can call is_password? on it
    end

    def reset_session_token!
        # remember to not only generate a new session token, but also to save it to the database
        # this will not work if you don't save to the database
        self.session_token = self.class.generate_session_token
        self.save!
        # return the new token for convenience
        self.session_token
    end

    def is_password?(password)
        # password_digest is just a string
        # convert it into a BCrypt::Password object so that we can call #is_password? on it
        bcrypt_password = BCrypt::Password.new(self.password_digest) # just turns it into a Password object, doesn't hash it again
        bcrypt_password.is_password?(password) # this is_password? is a different method entirely from User#is_password?
    end

    private

    def ensure_session_token
        # this will run whenever we instantiate a User object
        # that could happen because we're creating a new record,
        # or because we pulled one out of the database
        # that's why we use conditional assignment
        self.session_token ||= self.class.generate_session_token
    end

    # just returns a random string we can use as our session token
    def self.generate_session_token
        SecureRandom::urlsafe_base64 # a random base64 number/string
    end

end