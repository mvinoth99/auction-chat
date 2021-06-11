class Changewontostring < ActiveRecord::Migration[6.1]
  def change
    change_column :bids, :won, :string, :default => "Leading"
  end
end
