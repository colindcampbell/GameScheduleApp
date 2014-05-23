class Day
  include Mongoid::Document
  field :date, type: Date, default: Date.today
  

  belongs_to :league
  has_many :games
 

  before_destroy :destroy_games

  def destroy_games
     Game.where(day_id: self.id).destroy_all
  end

  validates_presence_of :date, message: " must be present"
  validate :current_date

  def current_date
  	existing_day = self.league.days.where(:date => self.date).first
  	if existing_day
  		errors.add(:date, '( This date exists, please select another day )')
  	end
  end

end
