class RemoveSomeColumnsToRocket < ActiveRecord::Migration[6.0]
  def change
    remove_column :rockets, :autonomy
    remove_column :rockets, :surface
    remove_column :rockets, :flag
  end
end
