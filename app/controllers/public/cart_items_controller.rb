class Public::CartItemsController < ApplicationController

  def index
    # 今ログインしているユーザーのカート情報
    @carts = current_customer.cart_items
    # 合計金額用の変数
    @total = 0
  end

  def create
    # カートに入れるが押された際の処理
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    # 選択した商品の削除
  destroy = CartItem.find(params[:id])
  destroy.destroy
  redirect_to cart_items_path
  end

  def destroy_all
    #そのユーザーが登録したカート内の商品全て削除
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount,:customer_id)
  end

end
