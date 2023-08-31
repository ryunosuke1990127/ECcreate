class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item =Item.find(params[:id])
    #フォーム用にからのインスタンスをセット
    @cart_item = CartItem.new
  end
end
