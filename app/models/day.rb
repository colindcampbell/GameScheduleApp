class Day
  include Mongoid::Document
  field :date, type: Date

  belongs_to :league
  has_many :games

  before_destroy :destroy_games

  def destroy_games
     Game.where(day_id: self.id).destroy_all
  end

end
