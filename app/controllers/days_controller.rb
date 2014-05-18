class DaysController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  
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
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    if @day.update(params.require(:day).permit(:date))
      redirect_to @day.league
    else
      render 'edit'
    end
  end

  def destroy
    @day = Day.find(params[:id])
    @league = @day.league
    @day.destroy
    redirect_to @league
   end
end
