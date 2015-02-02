class Vacation < ActiveRecord::Base
  
	# validates :pattern, presence: true
	acts_as_votable
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_presence_of :total_cost, :total_people, :description, :title
	validates_length_of :description, maximum: 300

  def description
    "This vacation for #{total_people} was only $#{total_cost}!"
  end

  def as_json(options={})
    super(:except => [:user_id, :created_at, :updated_at] , :methods => [:description])
  end

  # json image exceptions.. 
  # def image_url
  #   image.medium.url
  #   image.small.url
  # end

end
