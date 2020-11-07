class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|

      t.string :favorite_food, null: false
      t.string :hated_food
      t.text :myself, null: false
      t.references :user
      t.timestamps
    end
  end
end
