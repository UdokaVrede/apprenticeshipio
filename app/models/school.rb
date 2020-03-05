class School < ApplicationRecord
  #Associations
  :has_many apprentices
  :has_many partners

  # Validations
  validates :name, :location, :date_founded, :currently_operating, :presence => true
  validates_associated :apprentices
  validates_associated :partners
  allow_blank :cost, :type, :duration, :field
end

# TODO
# check date formatting
# check boolean formatting
# check cost formatting
