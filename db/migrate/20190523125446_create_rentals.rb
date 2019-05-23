class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :spaceship, foreign_key: true
      t.boolean :accepted
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
