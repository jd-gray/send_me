require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, :type => :model do

	# EMAIL TESTS
	# check to determine email exists
	it "has an email" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.email).to_not be_nil
	end

	# check to make sure email is not longer then 100 characters
	it { is_expected.to ensure_length_of(:email).is_at_most(100)}

	# check to make sure email is unique
	it { is_expected.to validate_uniqueness_of(:email) }

	# test to make sure user enters valid email format
	it do
      is_expected.to_not allow_value('jared').
                 for(:email)
    end

	# USERNAME TESTS
	# check for username to exists
	it "has a username" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.username).to_not be_nil
	end

	# expects username to respond
	it "responds to a username" do 
		expect(subject).to respond_to(:username)
	end

	# input is invalid without a username
	it "is invalid without a username" do 
		expect(subject).to be_invalid
	end

	# there is an error with a username is not provided
	it "raises an error without a username" do
	expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
	end

	# PASSWORD TESTS
	# check to determine a password exists
	it "has a password" do 
		user = FactoryGirl.build_stubbed(:a_user)
		expect(user.password_digest).to_not be_nil
	end
	
	# password has to be at least 6 characters long
	it { is_expected.to ensure_length_of(:password_digest).is_at_least(6) }

	# password can be no longer then 20 characters
    it { is_expected.to ensure_length_of(:password_digest).is_at_most(20)}

    # ASSOCIATION
    # it { is_expected.to have_many(:vacations) }
end
