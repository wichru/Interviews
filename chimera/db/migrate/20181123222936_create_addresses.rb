class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :zip_code
      t.string :country

      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
