class AddEquipmentsToRockets < ActiveRecord::Migration[6.0]
  def change
    add_column :rockets, :equipments, :jsonb, array: true, default: []
  end
end
