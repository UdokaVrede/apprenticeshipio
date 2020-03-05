class AddDetailsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :date_founded, :date
    add_column :schools, :currently_operating, :boolean
  end
end
