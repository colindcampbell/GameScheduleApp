class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def new
    @league = League.find(params[:league_id])
    @day = Day.new
  end

  def show
  end

  def create
    @league = League.find(params[:league_id])
    @day = @league.days.build(params.require(:day).permit(:date))
    if @day.save
      redirect_to @league
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
