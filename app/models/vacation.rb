class Vacation < ActiveRecord::Base
	validates_presence_of :total_cost, :total_people, :description
  	validates_length_of :description, maximum: 300
end
