class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :base_price
      t.timestamp :expiry_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
