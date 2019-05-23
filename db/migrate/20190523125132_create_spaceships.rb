class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price
      t.integer :max_capacity

      t.timestamps
    end
  end
end
