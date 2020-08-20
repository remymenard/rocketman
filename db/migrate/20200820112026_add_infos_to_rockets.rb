class AddInfosToRockets < ActiveRecord::Migration[6.0]
  def change
    add_column :rockets, :rooms_number, :integer
    add_column :rockets, :beds_number, :integer
    add_column :rockets, :bathrooms_number, :integer
    add_column :rockets, :travellers_number, :integer
    add_column :rockets, :surface, :integer
    add_column :rockets, :country, :string
    add_column :rockets, :city, :string
    add_column :rockets, :flag, :string
  end
end
