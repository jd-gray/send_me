class VacationsController < ApplicationController

	before_action :vacation_find, only: [:show, :edit, :update, :destroy]

	def index
		# vacations ordered in created order
		@vacations = Vacation.all.order("created_at DESC")
	end

	def show
	end

	def new
		# linking current user to the new method
		current_user = User.find(session[:user_id])
		@vacation = current_user.vacations.build
	end

	def create
		# current user id links to the vacations create method
		current_user = User.find(session[:user_id])
		@vacation = current_user.vacations.build(vacation_params)
		if @vacation.save
			redirect_to @vacation
		else 
			render :new
		end
	end

	def edit
	end

	def update
		if @vacation.update(vacation_params)
			redirect_to @vacation
		else
			render :edit
		end
	end

	def destroy
		@vacation.destroy
		respond_to do |format|
			format.html { redirect_to vacations_path }
      		format.json { head :no_content }
      	end
	end

	private

	def vacation_find
		@vacation = Vacation.find(params[:id])	
	end

	def vacation_params
		params.require(:vacation).permit(:total_cost, :total_people, :description, :title, :image, :body)
	end
end
