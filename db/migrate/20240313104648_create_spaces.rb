class CreateSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :spaces do |t|
      t.string :city
      t.string :address
      t.string :space_profession
      t.string :description
      t.integer :price_per_day
      t.integer :price_per_week
      t.integer :price_per_month
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
