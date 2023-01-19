class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :comment_count

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
  private
  def comment_count
    post.update(comments_counter: post.comments.all.length)
  end
end
