class LeaguesController < ApplicationController
	before_action :set_league, only: [:edit, :show, :destroy]
	

	def index
		@leagues = League.all
		#@league = League.where(:user_id => current_user)
	end

	def new
		@league = League.new
	end

	def show
		#For adding user specific leagues
		#@leagues = League.where(:user_id => current_user)
		@games = Game.all
		
	end

	def create
		@league = League.create(params.require(:league).permit(:name, :start_date, :end_date, :locations, :divisions))
		@league.user_id = current_user.id
		if @league.save
			@first = @league.start_date
			@last = @league.end_date
			create_days(@league, @first, @last)
			redirect_to leagues_path
		else
			render 'new'
		end
	end

	def update
		@league = League.find(params[:id])
		if @league.update_attributes(params.require(:league).permit(:name, :start_date, :end_date, :locations, :divisions))
			redirect_to league_path(id: @league.name.gsub(/ /,"-"))
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
		#this line was @league = League.find(params[:id])
		@league = League.find_by(name: params[:id].gsub(/-/, " "))
	end
end