class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|

      t.string :store_name, null: false
      t.string :address
      t.integer :genre_id, null: false
      t.integer :rating_id, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
