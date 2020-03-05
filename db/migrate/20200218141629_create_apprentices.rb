class CreateApprentices < ActiveRecord::Migration[5.2]
  def change
    create_table :apprentices do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :race
      t.string :gender
      t.string :previous_career
      t.string :linkedin_url
      t.string :photo_url
      t.datetime :date_started
      t.datetime :date_ended
      t.boolean :converted
      t.string :current_title
      t.string :current_company

      t.timestamps
    end
  end
end
