class Vacation < ActiveRecord::Base
  
	# validates :pattern, presence: true
	acts_as_votable
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments

	validates_presence_of :total_cost, :total_people, :description, :title
	validates_length_of :description, maximum: 300

  def description
    "This vacation for #{total_people} was only $#{total_cost}!"
  end

  def as_json(options={})
    super(:except => [:user_id, :create_at, :updated_at, :image] , :methods => [:description, :image_url ])
  end

  def image_url
    image.medium.url
  end

end
