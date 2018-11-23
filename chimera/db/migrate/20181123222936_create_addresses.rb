class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :zip_code
      t.string :country
      t.string :company_street
      t.string :company_city
      t.integer :company_zip_code
      t.string :company_country
      t.references :user

      t.timestamps
    end
  end
end
