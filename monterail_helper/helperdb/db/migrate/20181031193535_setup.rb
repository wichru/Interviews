class Setup < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |table|
      table.column :first_names, :string
      table.column :last_names, :string
      table.column :birthday, :date
    end

    create_table :posts do |table|
      table.column :title, :string
      table.column :content, :text
      table.column :posted_at, :datetime
    end

    create_table :comments do |table|
      table.column :content, :text
      table.column :posted_at, :datetime
    end
  end
end
