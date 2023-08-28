class Admin::ItemsController < ApplicationController
  def index
    # 商品一覧
    @items=Item.all
  end

  def new
    # 商品新規登録画面
    @item = Item.new
  end

  def create
    # 新規登録の処理
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end

  def show
    # 商品情報の詳細画面
    @item = Item.find(params[:id])
  end

  def edit
    # 商品情報の編集
    @item = Item.find{params[:id]}
  end

  def update
    @item= Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price,:image,:genre_id)
  end
end
