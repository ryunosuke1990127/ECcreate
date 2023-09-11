class Admin::OrdersController < ApplicationController

  # 注文履歴一覧ページ
  def index
    @order = Order.all
  end

  # 注文履歴の詳細
  def show
    # クリックした注文情報を取得
    @order = Order.find(params[:id])
    # クリックされた注文情報の商品情報を取得
    @order_item = @order.order_products
  end
end
