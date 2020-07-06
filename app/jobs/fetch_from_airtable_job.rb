require 'open-uri'
require 'json'

class FetchFromAirtableJob < ApplicationJob
  queue_as :default

  # When running this job pass "apprentices" or "companies" as a parameter.
  # e.g. FetchFromAirtableJob.perform_now("apprentices")
  def perform(table)
    table_data = []
    # The API returns 100 records per call ("page") and if it reaches it's limit it sends an "offset" key.
    # To "paginate" to the next 100 records, we should include the "offset" value in the request.
    query = ""
    begin
      url = "https://api.airtable.com/v0/app73alvcuASBVNl1/#{table}?view=Database%20Grid%20View" + query
      p url
      headers = {'Authorization' => 'Bearer keyH4gNinmHIAurse'}

      json = open(url, headers).read
      page = JSON.parse(json)  

      # Concatenate each array of records into table_data array.
      table_data.concat(page["records"])

      if !page["offset"].nil?
        query = "&offset=" + page["offset"]
      end
    end while !page["offset"].nil?

    # Transform table_data Array from an Array of Ruby Hashes to JSON and saves it in file
    dir = Rails.root.join('storage')
    data = File.new(dir + "#{table}.json", "w")
    data.puts(table_data.to_json)
    data.close
  end
  
end
