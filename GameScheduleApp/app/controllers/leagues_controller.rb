class LeaguesController < ApplicationController
	before_action :set_league, only: [:edit, :update, :show, :destroy]

	def index
		@leagues = League.all
	end

	def new
		@league = League.new
	end

	def show
	end

	def create
		@league = League.new(params.require(:league).permit(:name, :dates, :locations, :divisions))
		if @league.save
			redirect_to leagues_path
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
