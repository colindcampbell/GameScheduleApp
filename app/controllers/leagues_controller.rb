class LeaguesController < ApplicationController
	before_action :set_league, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user

	def index
		@leagues = League.all
	end

	def new
		@league = League.new
		#@league.user_id = current_user
	end

	def show
		@league = League.find(params[:id])
		#For adding user specific leagues
		#@leagues = League.where(:user_id => current_user)
		#in User model has_many :leagues
		#in League model belongs_to :user
		@leagues = League.all
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
