class Day
  include Mongoid::Document
  field :date, type: String

  belongs_to :league
  has_many :games
end
