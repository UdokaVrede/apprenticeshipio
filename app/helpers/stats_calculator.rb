class StatsCalculator
  def initialize
    @companies_gt_100_employees = {
      'San Francisco' => 4434,
      'New York City' => 3010,
      'Washington DC' => 2031,
      'Chicago' => 1022,
      'Seattle' => 957,
      'Houston' => 912,
      'Atlanta' => 739,
      'Los Angeles' => 708,
      'Dallas' => 595,
      'Austin' => 568,
      'Boston' => 568,
      'Minneapolis' => 357,
      'Denver' => 347,
      'Miami' => 329
    }
  end
  def get_companies_gt_100_employees
     return @companies_gt_100_employees
  end
end
