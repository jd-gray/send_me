class WelcomeController < ApplicationController
	include WelcomeHelper


	def index
		if params[:q] != nil
			get_weather(params[:q])
		end
	end


end
