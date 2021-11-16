class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(params[:id])
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: "true")
    reset_session
    redirect_to root_path
  end

  def unsubscribe

  end

  private

  def customer_params
    params require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number)
  end

end
