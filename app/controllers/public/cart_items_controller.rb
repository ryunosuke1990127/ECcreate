class Public::CartItemsController < ApplicationController

  def index
    # カート内の商品一覧
    @carts = CartItem.all
    byebug
  end

  def create
    # カートに入れるが押された際の処理
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
