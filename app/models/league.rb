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
  
end
