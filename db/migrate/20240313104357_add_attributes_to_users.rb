class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :siret_number, :string
    add_column :users, :user_profession, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :city, :string
  end
end
