class Public::CustomersController < ApplicationController
  # ユーザー編集ページが押されたときの処理
  def edit
    @user = Customer.find(current_customer.id)
  end

  # ユーザー編集ボタンが押されたときの処理
  def update
    @user = Customer.find(current_customer.id)
    @user.update(user_params)
    redirect_to customers_show_path(@user.id)
  end

  # ユーザーのマイページが押されたときの処理へ
  def show
    @user = Customer.find(current_customer.id)
  end

  # 退会処理確認画面
  def withdraw_check
  end

  # 退会処理
  def withdraw
    # ログインしているユーザー情報の取得
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    # セッションを消してTop画面へリダイレクト
    reset_session
    redirect_to admin_path
  end


  private

  def user_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number)
  end
end