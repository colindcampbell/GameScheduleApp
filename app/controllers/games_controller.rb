class GamesController < ApplicationController

	def index
		@games = Game.all
		@league = @game.league
	end

	def new
		@game = Game.new
		@league = League.find(params[:league_id])
		@teams = Team.all
		@@day = Day.find(params[:day_id])
	end

	def create
		@league = League.find(params[:league_id])
		@game = @league.games.build(params.require(:game).permit(:day, :location, :time, :sport, :home_team_id, :away_team_id))
		@game.day = @@day
	    @game.save
		if @game.save
			redirect_to @league
		else
			render 'new'
		end
	end

	
end
