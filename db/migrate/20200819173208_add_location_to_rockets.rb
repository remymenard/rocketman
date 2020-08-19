class AddLocationToRockets < ActiveRecord::Migration[6.0]
  def change
    add_column :rockets, :latitude, :float
    add_column :rockets, :longitude, :float
  end
end
