class League
  include Mongoid::Document
  field :name, type: String
  field :dates, type: String
  field :locations, type: String
  field :standings, type: String
  field :divisions, type: String
  has_many :games
end
