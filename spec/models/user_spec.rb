require 'rails_helper'

RSpec.describe User, :type => :model do

	it "responds to a name" do 
		expect(subject).to respond_to(:name)
	end

	it "is invalid without a name" do 
		expect(subject).to be_valid
	end

	it "raises an error without a name" do
	expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
	end
	
end
