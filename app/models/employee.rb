class Employee
  include Mongoid::Document
  field :name, type: String
  field :phone, type: String
  field :position, type: String

  has_many :employee_availabilities
end
