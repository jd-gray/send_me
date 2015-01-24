require 'rails_helper'

RSpec.describe User, :type => :model do

	it "has an email" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.email).to_not be_nil
	end

	it "has a password" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.password_digest).to_not be_nil
	end

	it "has a username" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.username).to_not be_nil
	end

	it "responds to a name" do 
		expect(subject).to respond_to(:username)
	end

	it "is invalid without a name" do 
		expect(subject).to be_invalid
	end

	it "raises an error without a name" do
	expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
	end
	
end
