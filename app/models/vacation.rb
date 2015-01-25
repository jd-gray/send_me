class Vacation < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :total_cost, :total_people, :description, :title
  	validates_length_of :description, maximum: 300
end
