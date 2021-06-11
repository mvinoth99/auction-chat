class OrdersController < ApplicationController

  def index
    @bids = Bid.all
  end

end
