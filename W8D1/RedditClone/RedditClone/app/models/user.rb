# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username,:session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true 
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password 
    after_initialize :ensure_session_token

    has_many :subs,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Sub

    has_many :posts,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Post

    def self.find_by_credentials(usr,pw)
        user = User.find_by(username: usr)
        return nil if user.nil? 
        user.is_password?(pw) ? user : nil
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def self.generate_session_token 
        SecureRandom.urlsafe_base64
    end

    def password=(pw)
        @password = pw 
        self.password_digest = BCrypt::Password.create(pw)
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token! 
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end
end
