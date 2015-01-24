FactoryGirl.define do
  factory :a_user, class: User do
    username "jaredgray"
	email "jared@jared.com"
	password_digest "jared"
	
  end

end
