class CreateRockets < ActiveRecord::Migration[6.0]
  def change
    create_table :rockets do |t|
      t.integer :daily_price
      t.string :name
      t.string :location
      t.integer :autonomy
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
