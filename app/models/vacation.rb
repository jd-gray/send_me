class Vacation < ActiveRecord::Base
	validates_presence_of :total_cost, :total_people, :description
end
