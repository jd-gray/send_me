module API
	module V1
		class VacationsController < ApplicationController
			# before_action :vacation_find, only: [:show, :edit, :update, :destroy]
			
		protect_from_forgery with: :null_session
	    respond_to :json

			def index
				vacations = Vacation.all
				respond_with vacations, {message: 'Hellow there!'}
			end

			def show
				vacation = Vacation.find(params[:id])	
				respond_with vacation 
			end

			def create
				vacation_find
				# current user id links to the vacations create method
				# current_user = User.find(session[:user_id])
				# vacation = current_user.vacations.build(vacation_params)
				if vacation.save
					respond_with vacation, location: [:api, vacation]
				else 
					respond_with vacation
				end
			end

			# def edit
			# 	vacation_find
			# end

			def update
				vacation_find
				if vacation.update_attributes(vacation_params)
					head 204
				else
					respond_with vacation
				end
			end

			def destroy
				vacation_find
				vacation.destroy
				# respond_to do |format|
				# 	format.html { redirect_to vacations_path }
		  #     		format.json { head :no_content }
		  #   	end
		  		head 204
			end

			private

			def vacation_find
				vacation = Vacation.find(params[:id])	
			end

			def vacation_params
				params.require(:vacation).permit(:total_cost, :description, :total_people,  :title, :image, :body)
			end

		end
	end
end