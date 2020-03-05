class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.integer :cost
      t.string :type
      t.integer :duration
      t.string :field

      t.timestamps
    end
  end
end
