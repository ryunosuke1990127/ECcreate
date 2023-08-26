# frozen_string_literal: true

class Public::UnlocksController < Devise::UnlocksController
   # 会員登録時の情報を許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
  end

  # GET /resource/unlock/new
  # def new
  #   super
  # end

  # POST /resource/unlock
  # def create
  #   super
  # end

  # GET /resource/unlock?unlock_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after sending unlock password instructions
  # def after_sending_unlock_instructions_path_for(resource)
  #   super(resource)
  # end

  # The path used after unlocking the resource
  # def after_unlock_path_for(resource)
  #   super(resource)
  # end
end
