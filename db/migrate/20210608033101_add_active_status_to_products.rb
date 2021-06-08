class AddActiveStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :active_status, :boolean
    change_column_default :products, :active_status, true
  end
end
