# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord 
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :views,
        dependent: :destroy,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare
    
    has_many :shared_artworks,
        dependent: :destroy,
        through: :views,
        source: :artwork

end
