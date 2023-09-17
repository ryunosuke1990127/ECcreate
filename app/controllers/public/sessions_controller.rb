# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   # 会員登録時の情報を許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action  :customer_state,only:[:create]

   def after_sign_in_path_for(resource)
     root_path
   end

   def after_sign_out_path_for(resource)
      root_path
   end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
  end

  def customer_state
    # ログインで入力されたemailからアカウントを意見取得
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_customer_registration_path
      else
        # 正しく入力されていないとき
        flash[:notice] = "項目を入力してください"
      end
    else
      # 登録したユーザーが見つからなかった場合
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
