class Admin::CustomersController < ApplicationController
  def index
    # ユーザーの一覧表示
    @customers = Customer.all
  end

  def edit
    # ユーザー名をクリックした際の詳細ページへ
   @customer = Customer.find(params[:id])
  end

  def update
    @customer= Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def show
     # ユーザー名をクリックした際の詳細表示
    @customer = Customer.find(params[:id])
  end

   def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted,:email)
   end
end
