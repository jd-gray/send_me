class Vacation < ActiveRecord::Base
	# validates :pattern, presence: true
	acts_as_votable
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments

	validates_presence_of :total_cost, :total_people, :description, :title
  	validates_length_of :description, maximum: 300

 #  	def as_json(options={})
 #  		super(:except => [:created_at, :updated_at]),
 #  			:methods => [:description]
 #  		)
	# end
end
