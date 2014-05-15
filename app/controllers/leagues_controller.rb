class LeaguesController < ApplicationController
	before_action :set_league, only: [:edit, :update, :show, :destroy]

	def index
		@leagues = League.all
	end

	def new
		@league = League.new
	end

	def show
		@leagues = League.all
		@month_abr = [0,'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','OCT','NOV','DEC']
	end

	def create
		@league = League.new(params.require(:league).permit(:name, :dates, :locations, :divisions))
		if @league.save
			redirect_to @league
		else
			render 'new'
		end
	end

	def update
		if @league.update_attributes(params.require(:league).permit(:name, :dates, :locations, :divisions))
			redirect_to @league
		else
			render 'edit'
		end
	end

	def destroy
		@league.destroy
		redirect_to leagues_path
	end


	private
	
	def set_league
		@league = League.find(params[:id])
	end
end
