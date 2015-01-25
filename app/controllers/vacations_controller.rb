class VacationsController < ApplicationController

	before_action :vacation_find, only: [:show, :edit, :update, :destroy]

	def index
		@vacations = Vacation.all 
	end

	def show

	end

	def new
		@vacation = Vacation.new
	end

	def create
		@vacation = Vacation.new
		if @vacation.save
			redirect_to @vacation 
		else 
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def vacation_find
		@vacation = Vacation.find(params[:id])	
	end
end
