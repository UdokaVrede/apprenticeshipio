class AddDetailsToApprentices < ActiveRecord::Migration[5.2]
  def change
    add_column :apprentices, :approved_to_publish, :boolean
    add_column :apprentices, :podcast_recorded, :boolean
  end
end
