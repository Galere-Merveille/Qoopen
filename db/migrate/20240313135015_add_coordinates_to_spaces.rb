class AddCoordinatesToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :latitude, :float
    add_column :spaces, :longitude, :float
  end
end
