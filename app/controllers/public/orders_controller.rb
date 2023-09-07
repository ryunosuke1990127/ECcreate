class Public::OrdersController < ApplicationController

  # 注文入力用の画面
  def new
  # 今ログインしているユーザー情報を取得
  @customer = current_customer
  @order = Order.new
  end

  # 注文確認処理
  def confirm
     # 合計金額用の変数
    @total = 0
    # そのユーザーのカート情報を定義
    @cart =current_customer.cart_items

    if params[:order][:select_address]==0
    # 自分の住所を選択
    @order = Order.new(order_params)
    @order.post_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.adress_name = current_customer.first_name + current_customer.last_name
    byebug
    elsif params[:order][:select_address]==1
    # 新しい配送先を設定
    @order = Order.new(order_params)
    else
    binding.pry
    end
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:adress_name,:address,:post_code)
  end

end

