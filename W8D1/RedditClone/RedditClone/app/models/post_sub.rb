class PostSub < ApplicationRecord
    validates :post_id, presence: true, uniqueness: { scope: :sub_id, message: "Post can't be in a sub twice."}

    belongs_to :posts
    belongs_to :subs
end
