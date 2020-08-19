class AddAddressToRockets < ActiveRecord::Migration[6.0]
  def change
    add_column :rockets, :address, :string
  end
end
