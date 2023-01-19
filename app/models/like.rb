class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belong_to :post
end
