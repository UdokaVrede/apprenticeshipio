class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :size
      t.integer :salary
      t.datetime :upcoming_cohort
      t.integer :number_of_apprentices
      t.integer :number_of_cohorts

      t.timestamps
    end
  end
end
