class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :vacation

	validates_presence_of :body
	validates_length_of :body, maximum: 200
end
