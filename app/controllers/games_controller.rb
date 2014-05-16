class GamesController < ApplicationController

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
			redirect_to @league
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
      redirect_to @game.league
    else
      render 'edit'
    end
	end

	def destroy
		@game = Game.find(params[:id])
		@league = @game.league
		@game.destroy
    	redirect_to @league
	end

	
end
