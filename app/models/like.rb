class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belong_to :post

  def like_count
    post.update(likes_counter: post.likes.all.length)
  end
end
