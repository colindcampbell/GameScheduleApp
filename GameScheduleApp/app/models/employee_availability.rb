class EmployeeAvailability
  include Mongoid::Document
  field :company, type: String
  belongs_to :employee
  belongs_to :available_day
end
