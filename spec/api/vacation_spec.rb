require 'rails_helper'
require 'shoulda-matchers'

describe "Vacations API", :type => :request do

  let(:request_headers) {{"Accept" => "application/json", "Content-type" => "application/json"}}

  it "returns a list of vacations" do
    FactoryGirl.create_list(:vacation, 10)

    get "/api/vacations"

    expect(response).to have_http_status 200
    expect(response.content_type).to eq(Mime::JSON.to_s)
    vacations = JSON.parse(response.body)
    expect(vacations.count).to eq(10)
  end

  #   it "returns a specific vacation" do
  #     vacation = FactoryGirl.create(:vacation)

  #     get "/api/vacations/#{vacation.id}"

  #     # returned_vacation = JSON.parse(response.body)

  #     expect(response).to have_http_status 200
  #     expect(response.body).to eq(vacation.to_json)
  #   end

  #  it "creates a new vacation" do
  #   vacation_attributes = { "vacation" => FactoryGirl.attributes_for(:vacation) }.to_json

  #   post "/api/vacations", vacation_attributes, request_headers

  #   vacation = JSON.parse(response.body)
  #   expect(response).to have_http_status 201
  #   expect(response.location).to eq("http://api.example.com/users/vacations/#{vacation['id']}")
  # end

  # it "does not create a new vacation with description nil" do
  #   vacation_attributes = { "vacation" => FactoryGirl.attributes_for(:vacation, description: nil) }.to_json
    
  #   post "/api/vacations", vacation_attributes, request_headers

  #   expect(response).to have_http_status 422
  # end

  # it "updates a specific vacation" do
  #   vacation = FactoryGirl.create(:vacation)
  #   vacation_attributes = { "vacation" => { "title" => "striped" } }.to_json

  #   patch "/api/vacations/#{vacation.id}", vacation_attributes, request_headers
  #   expect(response).to have_http_status 204
  #   expect(vacation.reload.pattern).to eq("striped")
  # end

  # it "is unsuccessful on update without a pattern attribute" do
  #   vacation = FactoryGirl.create(:vacation)
  #   vacation_attributes = { "vacation" => { "pattern" => nil } }.to_json

  #   patch "/api/vacations/#{vacation.id}", vacation_attributes, request_headers
  #   expect(response).to have_http_status 422
  # end

  # it "destroys a specific vacation" do
  #   vacation = FactoryGirl.create(:vacation)

  #   delete "/api/vacations/#{vacation.id}"
  #   expect(response).to have_http_status 204
  # end

end