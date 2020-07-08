require 'open-uri'
require 'json'

class CalcAirtableStatsJob < ApplicationJob
  queue_as :default

  # Run:
  # CalcAirtableStatsJob.perform_now
  def perform
    dir = Rails.root.join('storage')
    apprentices = JSON.parse(File.open(dir + "apprentices.json", "r").read)
    companies = JSON.parse(File.open(dir + "companies.json", "r").read)

    # total_aprnts # number of aprnts
    total_aprnts = apprentices.length()
    
    # total_companies # number of companies
    total_companies = companies.length()

    aprnts_gt_4_degree = 0
    aprnts_bootcamp = 0
    aprnts_per_prev_career = {}
    aprnts_ugi = 0
    aprnts_uri = 0
    aprnts_to_fte = 0

    apprentices.each do |ap|
      # aprnts_gt_4_degree # number of aprnts with 4y degrees
      if ap["fields"]["degree_program_duration_1"].is_a?(Integer) && ap["fields"]["degree_program_duration_1"] >= 4 ||
         ap["fields"]["degree_program_duration_2"].is_a?(Integer) && ap["fields"]["degree_program_duration_2"] >= 4
        aprnts_gt_4_degree += 1
      end
      # aprnts_bootcamp # number of aprnts who came from bootcamps
      if ap["fields"]["education_type_1"] === "Non-traditional program (short term vocational)" ||
         ap["fields"]["education_type_2"] === "Non-traditional program (short term vocational)" ||
         ap["fields"]["education_type_3"] === "Non-traditional program (short term vocational)"
         aprnts_bootcamp += 1
      end
      # aprnts_per_prev_career (multiple)
      aprnts_per_prev_career[ap["fields"]["previous_career"]] = 0 if aprnts_per_prev_career[ap["fields"]["previous_career"]].nil?
      aprnts_per_prev_career[ap["fields"]["previous_career"]] += 1
      # perc_aprnts_urm # % of aprnts from underrepresented gender identity
      aprnts_ugi += 1 if ap["fields"]["gender"]
      # perc_aprnts_uri # % of aprnts from underrepresented racial identity
      aprnts_uri += 1 if ap["fields"]["race"]
      # perc_aprnts_to_fte # % of aprnts who convert to full time role
      aprnts_to_fte += 1 if ap["fields"]["converted"]
    end

    companies_per_employee = {}
    aprnts_per_co = {}

    companies.each do |co|
      # companies_per_employee
      companies_per_employee[co["fields"]["company_size"]] = 0 if companies_per_employee[co["fields"]["company_size"]].nil?
      companies_per_employee[co["fields"]["company_size"]] += 1
      # aprnts_per_co # number of aprnts per company
      aprnts_per_co[co["fields"]["name"]] = co["fields"]["number_of_apprentices"]
    end

    p 'total apprentices', total_aprnts
    p 'total companies', total_companies
    p 'aprnts_gt_4_degree', aprnts_gt_4_degree
    p 'aprnts_bootcamp', aprnts_bootcamp
    p 'aprnts_per_prev_career', aprnts_per_prev_career
    p 'aprnts_ugi', aprnts_ugi
    p 'aprnts_uri', aprnts_uri
    p 'aprnts_to_fte', aprnts_to_fte
    p 'companies_per_employee', companies_per_employee
    p 'aprnts_per_co', aprnts_per_co

    return total_aprnts,
      total_companies,
      aprnts_gt_4_degree,
      aprnts_bootcamp,
      aprnts_per_prev_career,
      aprnts_ugi,
      aprnts_uri,
      aprnts_to_fte,
      companies_per_employee,
      aprnts_per_co
    
  end
end


# Comments On Data:
# 55 records without Previous Career field

# Pending:
# aprnts_avg_comp # average compensation
# avg_aprntship_length # average apprenticeship length
# perc_aprnts_churn_lt_1y # % of aprnts who stay > 1 year after aprntship
# avg_employee_per_co # average number of employees per company
# avg_aprnts_per_y_co # average number of aprnts per year per company



