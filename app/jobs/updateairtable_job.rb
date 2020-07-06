require 'open-uri'

class UpdateAirtableJob < ApplicationJob
  queue_as :default

  def fetch_airtable_api(table)
    airtable_api = "https://api.airtable.com/v0/app73alvcuASBVNl1/#{table}"

    table_json = open(airtable_api).read
    table_info = JSON.parse(table_json)
    # tables_array = 
    tables_array.each do |table|
      # TODO decide what to do
    end
  end

  def perform
    tables_array = ["apprentices", "companies", "partners", "schools"]

    tables_array.each do |table|
      fetch_airtable_api(table)
    end
  end
end

