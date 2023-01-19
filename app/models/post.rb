class Post < ApplicationRecord
	belongs_to :author, class_name: 'User'
	has_many :comments, foreign_key: :post_id
	has_many :likes, foreign_key: :post_id
	validates :title, presence: true, length: { maximum: 250 }
	validates :comments_counter, length: { minimum: 0 }
	validates :likes_counter, length: { minimum: 0 }

	after_save :post_count
	def recent_comment
		comments.order(created_at: :desc).limit(5)
	end

	private

	def post_count
		author.update(posts_counter: author.posts.all.length)
	end
end
