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
    @order = Order.new

    # 選択した支払方法を取得
    @payment_method = params[:order][:payment_method]

    # 選択したお届け先方法を取得
    address_code = params[:order][:select_address]
    if address_code == "0"
      # 自分の住所を選択
        @order.post_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.adress_name = current_customer.first_name + current_customer.last_name
        @order_address = @order.post_code + @order.address + @order.adress_name
    elsif address_code == "1"
       # 新しい配送先を設定
        @order_address=params[:order][:post_code] + params[:order][:address] + params[:order][:adress_name]
    else
      render :new
    end
  end

  # 注文確定処理
  def create
    # そのユーザーのカート情報を取得
    @cart =current_customer.cart_items
    # データの受け取り
    @order = Order.new(order_params)
    @order.shipping_fee= 800
    # 注文情報のユーザー情報にログインしているユーザの情報を紐づける
    @order.customer_id = current_customer.id
    # 取得データをモデルへ保存
    @order.save!
    # 注文詳細への保存(カート内を一つずつ取得し注文詳細へ保存)
    @cart.each do |c|
      order_product = OrderProduct.new
      # 注文情報との紐付け
      order_product.order_id =@order.id
      # 商品IDの紐付け
      order_product.item_id = c.item_id
      # 数量の紐付け
      order_product.amount = c.amount
      order_product.unit_price = c.item.price
      order_product.save
    end

     # カート内の削除
     @cart.destroy_all

     redirect_to orders_conplete_path
  end

  def complete
  end

  # ログインしているユーザーの注文履歴を表示
  def index
    # ログインしているユーザーの一覧を取得
    @order = current_customer.orders
    @total = 0
  end

  def show
    # クリックした注文情報を取得
    @order_details =Order.find(params[:id])
    @total =0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:adress_name,:address,:post_code,:total_amount,:shipping_fee,:id)
  end

end

