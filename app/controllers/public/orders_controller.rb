class Public::OrdersController < ApplicationController

  # 注文入力用の画面
  def new
  @order = Order.new
  end

  def index
  end

  def show
  end
end
