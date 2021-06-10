class Product < ApplicationRecord
  after_create :expire
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :bids , dependent: :destroy


  def expire
    self.active_status = false
    if self.bids
      bids = self.bids
      bids.each do |bid|
        if bid.price == self.bids.maximum('price')
          bid.won = true
          bid.save
        end
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
