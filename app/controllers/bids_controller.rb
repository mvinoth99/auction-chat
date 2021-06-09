class BidsController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_product

  def index
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = @product.bids.new(bid_params)
    if @product.bids.maximum('price')
      if(@bid.price <= @product.bids.maximum('price'))
        #flash[:error] = "Bid price must be higher than previous highest bid"
        redirect_to @product,alert: 'Bid price must be higher than previous highest bid'
        return 
      end
    end
    @bid = @product.bids.new(bid_params)
    @bid.product_id = @product.id
    @bid.save
    redirect_to @product
  end



  private
  
  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_bid
    @bid = Bid.find(params[:id])
  end

  def bid_params
    params.require(:bid).permit(:price,:user_id)
  end

end
