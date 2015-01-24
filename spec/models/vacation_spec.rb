require 'rails_helper'

RSpec.describe Vacation, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:vacation)).to be_valid 
	end
	
	it "is invalid without a total cost" do
		cost = FactoryGirl.build(:vacation, total_cost: nil)
		expect(cost).to be_invalid 
	end

	it "has a description of the vacation" do
		description = FactoryGirl.build(:vacation, description: nil)
		expect(description).to be_invalid
	end

	it "has a total people amount" do
		people = FactoryGirl.build(:vacation, total_people: nil)
		expect(people).to be_invalid
	end
end
