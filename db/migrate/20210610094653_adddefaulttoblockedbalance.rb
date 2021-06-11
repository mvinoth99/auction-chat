class Adddefaulttoblockedbalance < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :blocked_balance, :decimal, :default => 0
  end
end
