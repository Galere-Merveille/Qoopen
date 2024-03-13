class CreateSpaceRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :space_ratings do |t|
      t.text :comment
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
