class TeamsController < ApplicationController
	
	before_action :set_team, only: [:edit, :update, :show, :destroy]

	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params.require(:team).permit(:name, :coach, :location))
		if @team.save
			redirect_to teams_path
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
		@team.destroy
		redirect_to teams_path
	end

	private
	
	def set_team
		@team = Team.find(params[:id])
	end


end
