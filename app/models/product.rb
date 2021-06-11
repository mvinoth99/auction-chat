class Product < ApplicationRecord
  after_create :expire
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bids , dependent: :destroy

  def expire
    owner = nil
    self.active_status = false
    if self.bids
      bids = self.bids
      bids.each do |bid|
        user = bid.user
        if bid.price == self.bids.maximum('price')
          bid.won = "Won"
          user.balance -= bid.price
          user.blocked_balance -= bid.price
          owner = bid.product.user
          owner.balance += bid.price
          owner.save
        end
        user.save
        bid.save
      end
      #self.bids.where(price: self.bids.maximum('price')).first.won = true
     end
    self.save
  end

  def when_to_run
    self.expiry_time.to_datetime
  end

  handle_asynchronously :expire, :run_at => Proc.new { |i| i.when_to_run }

end
