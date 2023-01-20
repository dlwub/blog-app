class Post < ApplicationRecord
	belongs_to :author, class_name: 'User'
	has_many :comments, foreign_key: :post_id
	has_many :likes, foreign_key: :post_id
	validates :title, presence: true, length: { maximum: 250 }
	validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: {only_integer: true}
	validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: {only_integer: true}

	after_save :post_count
	def recent_comment
		comments.order(created_at: :desc).limit(5)
	end

	private

	def post_count
		author.update(posts_counter: author.posts.all.length)
	end
end
