require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

	# TODO: Write new test
  # describe "GET body" do
  #   it "returns http success" do
  #     get :body
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  it 'responds with success' do
      expect(response).to be_success
    end

end
