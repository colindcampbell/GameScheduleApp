class GamesController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@games = Game.all
		@league = @game.league
	end

	def new
		@game = Game.new
		@league = League.find(params[:league_id])
		@@day = Day.find(params[:day_id])
	end

	def create
		@league = League.find(params[:league_id])
		@game = @league.games.build(params.require(:game).permit(:day, :location, :time, :sport, :home_team_id, :away_team_id))
		@game.day = @@day
	    @game.save
		if @game.save
			redirect_to league_path(id: @league.name.gsub(/ /,"-"))
		else
			render 'new'
		end
	end

	def edit
		@game = Game.find(params[:id])
		@l = @game.league
    @teams = @l.teams
	end

	def update
		@game = Game.find(params[:id])
		@l = @game.league
  		@teams = @l.teams
    	if @game.update(params.require(:game).permit(:location, :time, :sport, :home_team_id, :home_score, :away_team_id, :away_score, :final))
     	 	@game.outcome
      		redirect_to league_path(id: @game.league.name.gsub(/ /,"-"))
    	else
      		render 'edit'
    	end
	end

	def destroy
		@game = Game.find(params[:id])
		@league = @game.league
		#run reverse_outcome
		@game.destroy
    	redirect_to league_path(id: @league.name.gsub(/ /,"-"))
	end

	
end
