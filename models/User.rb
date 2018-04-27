class User < ActiveRecord::Base
	has_many :posts
	has_many :tags
	has_many :favorites
end