class Comment < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :author, foreign_key: :author_id, class_name: "User" 
end
