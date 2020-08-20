class AddContinentToRockets < ActiveRecord::Migration[6.0]
  def change
    add_column :rockets, :continent, :string
  end
end
