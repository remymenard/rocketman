class RemoveLocationToRockets < ActiveRecord::Migration[6.0]
  def change
    remove_column :rockets, :location
  end
end
