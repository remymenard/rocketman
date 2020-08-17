class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :rocket, null: false, foreign_key: true
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.date :begin_date
      t.date :end_date
      t.string :status
      t.integer :total_price

      t.timestamps
    end
  end
end
