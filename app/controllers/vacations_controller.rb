class VacationsController < ApplicationController

	before_action :vacation_find, only: [:show, :edit, :update, :destroy]

	def index
		@vacations = Vacation.all 
	end

	def show
		vacation_find
	end

	def new
		@vacation = Vacation.new
	end

	def create
		@vacation = Vacation.new(vacation_params)
		if @vacation.save
			redirect_to vacation_path(@vacation)
		else 
			render :new
		end
	end

	def edit
		vacation_find
	end

	def update
		vacation_find
		if @vacation.update_attributes(vacation_params)
			redirect_to vacation_path(@vacation)
		else
			render :edit
		end
	end

	def destroy
		vacation_find
		@vacation = Vacation.destroy
		redirect_to vacations_path
	end

	private

	def vacation_find
		@vacation = Vacation.find(params[:id])	
	end

	def vacation_params
		params.require(:vacation).permit(:total_cost, :total_people, :description, :title, :image, :body)
	end
end
