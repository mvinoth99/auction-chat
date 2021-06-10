class AddwontoBid < ActiveRecord::Migration[6.1]
  def change
    add_column :bids, :won, :boolean,:default => 0
  end
end
