class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rocket, null: false, foreign_key: true
      t.integer :rating, limit: 5
      t.string :description, maxlength: 255
    end
  end
end
