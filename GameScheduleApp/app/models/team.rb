class Team
  include Mongoid::Document
  field :name, type: String
  field :wins, type: Integer, default:0
  field :losses, type: Integer, default:0
  field :coach, type: String
  field :location, type: String

  has_many :home_games, class_name: 'Game', inverse_of: :home_team
  has_many :away_games, class_name: 'Game', inverse_of: :away_team

  #has_many :players
end
