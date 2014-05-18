class TeamsController < ApplicationController
	
	before_action :set_team, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
	

	def index
		@teams = Team.all
	end

	def new
		@league = League.find(params[:league_id])
	    @team = @league.teams.build
	end

	def create
		@league = League.find(params[:league_id])
		@team = @league.teams.build(params.require(:team).permit(:name, :coach, :home_city))
		if @team.save
			redirect_to @league
		else
			render 'new'
		end
	end

	def show
	end

	def update
		if @team.update_attributes(params.require(:team).permit(:name, :coach, :location))
			redirect_to @team
		else
			render 'edit'
		end
	end

	def destroy
		@league = @team.league
		@team.destroy
		redirect_to @league
	end

	private
	
	def set_team
		@team = Team.find(params[:id])
	end


end
