class PagesController < ApplicationController
  def home
  end

  def about_us
    @team_members = [
      {name: "Lyn Muldrow", img_url: "https://i.imgur.com/TWFrhpM.jpg", job: "Senior Developer Educator", company: "at DigitalOcean", location: "Atlanta, GA"},
      {name: "Kam Klauschie", img_url: "https://i.imgur.com/XZQLbYh.jpg", job: "Front End Engineer + Career Advisor", company: "at Pathrise", location: "Rio de Janeiro, Brazil"},
      {name: "Amelia Padua", img_url: "https://i.imgur.com/PM3nEsv.jpg", job: "Software Engineer", company: "at Pixavo", location: "Chicago, IL" },
      {name: "Marcos Cannabrava", img_url: "https://i.imgur.com/WcCT27g.jpg", job: "Co-Founder & Lead Developer", company: "at CareConsult", location: "Rio de Janeiro, Brazil"},
      {name: "Zara Aslam", img_url: "https://i.imgur.com/TWFrhpM.jpg", job: "Looking for New Opportunities", company: "Due to COVID-19", location: "Seattle, WA"}
    ]
  end

  def our_data
    @total_aprnts,
    @total_companies,
    aprnts_gt_4_degree,
    aprnts_bootcamp,
    aprnts_per_prev_career,
    aprnts_ugi,
    aprnts_uri,
    @aprnts_to_fte,
    companies_per_employee,
    aprnts_per_co = CalcAirtableStatsJob.perform_now

    @perc_aprnts_gt_4_degree = ((aprnts_gt_4_degree.to_f/@total_aprnts)*100).round
    @perc_aprnts_bootcamp = ((aprnts_bootcamp.to_f/@total_aprnts)*100).round
    @perc_aprnts_ugi = ((aprnts_ugi.to_f/@total_aprnts)*100).round
    @perc_aprnts_uri = ((aprnts_uri.to_f/@total_aprnts)*100).round

    @top_five_prev_careers = aprnts_per_prev_career.select { |k, v| !k.nil? }
      .sort_by { |k, v| -v }.first(5).map {|item| item[0]}.join(", ")

    @aprnts_per_prev_career = aprnts_per_prev_career

    @co_most_apprentices_tracked = aprnts_per_co.sort_by { |k, v| -v }.first

    @companies_per_employee = companies_per_employee.sort_by { |k, v| -v }
  end

  def hall_of_fame
  end

  def candidates
  end

  def apprentices
  end

  def employers
  end

  def educators
  end

  def apply_now
  end
end
