class Partner < ApplicationRecord
  #Associations
  has_many :companies
  has_many :schools

  # Validations
  validates :name, :location, :date_founded, :currently_operating, :presence => true
  allow_blank :type
end

# TODO
# check date formatting
# check boolean formatting
