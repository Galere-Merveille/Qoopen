class AddStatusToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :status, :boolean, default: false
  end
end
