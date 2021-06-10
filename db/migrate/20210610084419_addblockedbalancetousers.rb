class Addblockedbalancetousers < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :blocked_balance, :decimal
  end
end
