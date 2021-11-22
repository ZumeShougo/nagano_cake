class Public::OrdersController < ApplicationController
  def index
    
  end
  
  def edit
    
  end
  
  def create
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @adress.name
  end
  
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address)
  end
end
