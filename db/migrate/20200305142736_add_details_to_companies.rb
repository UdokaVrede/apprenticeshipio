class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :location, :string
    add_column :companies, :apprenticeship_location, :string
    add_column :companies, :company_url, :string
    add_column :companies, :apprenticeship_url, :string
  end
end
