class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
