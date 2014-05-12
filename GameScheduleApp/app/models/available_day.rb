class AvailableDay
  include Mongoid::Document
  field :dow, type: String
  field :shift, type: String

  has_many :employee_availabilities
end
