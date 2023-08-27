class Public::CustmoersController < ApplicationController

  # ユーザー編集ページが押されたときの処理
  def edit
    @user = Customer.find(params[:id])
  end

  # ユーザー編集ボタンが押されたときの処理
  def update
    @user = Customer.find(params[:id])
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
  end

  # ユーザーのマイページが押されたときの処理へ
  def show
    @user = Customer.find(params[:id])
  end

  # 退会処理確認画面
  def withdraw_check
    # クリックしたユーザー情報の取得
    @user = Customer.find(params[:id])
  end

  # 退会処理
  def withdraw
  end


  private

  def user_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number)
  end
end
