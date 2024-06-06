class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_item = current_user.cart.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path, notice: 'Product was successfully added to cart.'
    else
      redirect_to products_path, alert: 'Could not add product to cart.'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
