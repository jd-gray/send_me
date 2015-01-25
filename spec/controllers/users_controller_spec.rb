require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	it "should get new" do 
		get :new
		assert_response :success
	end

end
