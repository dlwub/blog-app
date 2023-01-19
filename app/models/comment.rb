class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  def comment_count
    post.update(comments_counter: post.comments.all.length)
  end
end
