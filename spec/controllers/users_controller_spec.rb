require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	it "should get new" do 
		get :new
		assert_response :success
	end

	it 'responds with success' do
      expect(response).to be_success
   end


end
