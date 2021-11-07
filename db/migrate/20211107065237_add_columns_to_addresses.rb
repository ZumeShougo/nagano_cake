class AddColumnsToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :name, :string
    add_column :addresses, :postal_code, :string
    add_column :addresses, :addresses, :string
  end
end
