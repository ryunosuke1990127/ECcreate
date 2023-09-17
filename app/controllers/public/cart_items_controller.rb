class Public::CartItemsController < ApplicationController

  def index
    # 数量変更のフォームを入れるためフォーム用の空のインスタンスをセット
    @cart = CartItem.new
    # 今ログインしているユーザーのカート情報
    @carts = current_customer.cart_items
    # 合計金額用の変数
    @total = 0

  end

  def create
    # 今ログインしているユーザーが追加した商品がそのユーザーのカート内にあるかチェック
    if current_customer.cart_items.find_by(item_id: params[:cart_item] [:item_id])
      # すでに登録がある場合はプラス
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item] [:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
    else
      # そのユーザーのカート内に登録がない場合
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save
    end
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
