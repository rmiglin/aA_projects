# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class ShortenedUrl<ApplicationRecord
    validates :user_id, presence: true, uniqueness: true
    validates :short_url, presence: true
    validates :long_url, presence: true

    belongs_to :users,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    
    def ShortenedUrl.random_code
        SecureRandom.urlsafe_base64(22)
    end
end
