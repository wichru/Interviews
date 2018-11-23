class AddComapnyIdToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :company
  end
end
