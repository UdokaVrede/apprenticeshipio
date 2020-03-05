class Apprentice < ApplicationRecord
  #Associations
  :belongs_to company
  :belongs_to school
  #Validations
  validates :email, :linkedin_url :uniqueness => true
  validates :email, :linkedin_url, :date_started, :date_ended, :converted, :approved_to_publish, :podcast_recorded, :presence => true
  allow_blank :race, :gender, :previous_career, :photo_url, :current_title, :current_company
end

# TODO
# check date formatting
# check boolean formatting
# check first name + last name validation
# check email validation
