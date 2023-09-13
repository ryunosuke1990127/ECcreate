class Admin::OrdersController < ApplicationController

  # 注文履歴一覧ページ
  def index
    @order = Order.all
  end

  # 注文履歴の詳細
  def show
    # 商品合計の金額用の変数を初期化
    @total = 0
    # クリックした注文情報を取得
    @order = Order.find(params[:id])
    @order.shipping_fee =800
    # クリックされた注文情報の商品情報を取得
    @order_item = @order.order_products
  end
end
