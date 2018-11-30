class UserAdditionalFields < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :integer
  end
end
