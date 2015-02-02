module VacationsHelper
  def get_vacation(description)
    description = vacation.description "", "+"
    @vacation = HTTParty.get("https://sendmeapp.herokuapp.com/api/v1/users/vacations")
  end
end
