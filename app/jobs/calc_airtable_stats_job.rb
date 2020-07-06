require 'open-uri'
require 'json'

class CalcAirtableStatsJob < ApplicationJob
  queue_as :default

  def perform
    dir = Rails.root.join('storage')
    apprentices = JSON.parse(File.open(dir + "apprentices.json", "r").read)
    # companies = JSON.parse(File.open(dir + "companies.json", "r").read)

    total_aprnts = apprentices.length()
    p total_aprnts
    aprnts_gt_4_degree = 0
    
    apprentices.each do |ap|
      if ap["fields"]["degree_program_duration_1"].is_a?(Integer) && ap["fields"]["degree_program_duration_1"] >= 4
        aprnts_gt_4_degree += 1
        next
      end
      if ap["fields"]["degree_program_duration_2"].is_a?(Integer) && ap["fields"]["degree_program_duration_2"] >= 4
        aprnts_gt_4_degree += 1
        next
      end
    end

    p aprnts_gt_4_degree

  end
end


# total_aprnts # number of aprnts
# aprnts_gt_4_degree # number of aprnts with 4y degrees

# TO-DO: Next Stat: aprnts_bootcamp. How to define which school is a bootcamp?
# TO-DO: clean database! Important!

# aprnts_bootcamp # number of aprnts who came from bootcamps
# aprnts_per_prev_career (multiple) # --- maybe hardcode this one ---
# perc_aprnts_ugi # % of aprnts from underrepresented gender identity
# perc_aprnts_uri # % of aprnts from underrepresented racial identity
# total_companies # number of companies
# aprnts_avg_comp # average compensation
# avg_aprntship_length # average apprenticeship length
# perc_aprnts_to_fte # % of aprnts who convert to full time role
# perc_aprnts_churn_lt_1y # % of aprnts who stay > 1 year after aprntship
# companies_per_employee # --- maybe hardcode this one ---
# avg_employee_per_co # average number of employees per company
# avg_aprnts_per_y_co # average number of aprnts per year per company
# aprnts_per_co # number of aprnts per company
