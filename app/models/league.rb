class League
  include Mongoid::Document
  field :name, type: String
  field :locations, type: String
  field :dates, type: String
  field :divisions, type: String
 
  has_many :days
  has_many :games
  has_many :teams
  belongs_to :user

  before_destroy :destroy_children

  def destroy_children
  	Day.where(league_id: self.id).destroy_all
    Game.where(league_id: self.id).destroy_all
    Team.where(league_id: self.id).destroy_all
  end
  
end
