class AddUpdatesToApprentices < ActiveRecord::Migration[5.2]
  def change
    add_column :apprentices, :apprenticeship_duration, :integer
    add_column :apprentices, :email_backup, :string
    add_column :apprentices, :apprenticeship_company, :string
  end
end
