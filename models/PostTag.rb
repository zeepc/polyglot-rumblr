class PostTag < ActiveRecord::Base
	belongs_to :tag
	belongs_to :post
	has_many :tags, through: :post_tags
end