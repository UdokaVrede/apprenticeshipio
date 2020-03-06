# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

csv_options = { col_sep: ',', headers: :first_row }
filepath    = 'db/database.csv'

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row['first_name']} #{row['last_name']} was an apprentice at #{row['apprenticeship_company']}"

  Apprentice.create({
    first_name: row["first_name"],
    last_name: row["last_name"],
    email: row["email"],
    linkedin_url: row["linkedin_url"],
    date_started: row["date_started"],
    date_ended: row["date_ended"],
    converted: row["converted"],
    approved_to_publish: row["approved_to_publish"],
    podcast_recorded: row["podcast_recorded"],
    apprenticeship_duration: row["apprenticeship_duration"],
    email_backup: row["email_backup"],
    apprenticeship_company: row["apprenticeship_company"]
  })
end
