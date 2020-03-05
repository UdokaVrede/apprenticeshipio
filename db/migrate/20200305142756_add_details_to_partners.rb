class AddDetailsToPartners < ActiveRecord::Migration[5.2]
  def change
    add_column :partners, :date_founded, :date
    add_column :partners, :currently_operating, :boolean
  end
end
