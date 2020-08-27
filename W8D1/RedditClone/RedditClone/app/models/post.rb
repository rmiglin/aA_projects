# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true
    
    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User 
    
    belongs_to :sub,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Sub 
end
