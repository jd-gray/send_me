# Be sure to restart your server when you modify this file.

# will log user out after 45 minutes
Rails.application.config.session_store :cookie_store, 
	key: '_send_me_session',
 	:expire_after => 45.minutes
