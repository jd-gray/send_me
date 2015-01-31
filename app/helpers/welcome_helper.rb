module WelcomeHelper

	def get_weather(city)
		city = city.gsub " ", "+"
		@weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}")
		k = @weather['main']['temp']
		degree_f =((k - 273.15) * 1.8 ) + 32
		@degree_f = degree_f.round
		@picture = @weather['weather'][0]['icon']		
	end
end

