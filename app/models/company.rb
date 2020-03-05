class Company < ApplicationRecord
  #Associations
  :has_many apprentices
  :has_many partners

  # Validations
  validates :name, :size, :location, :apprenticeship_location, :company_url, :presence => true
  allow_blank :salary, :upcoming_cohort, :number_of_cohorts, :number_of_apprentices, :apprenticeship_url
end

# TODO
# check date formatting
# check salary formatting
