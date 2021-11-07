class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = Order.find(@order_detail.order_id)
    @order.customer = User.find(@order.customer_id)
    @product_check = OrderDetail.where(order_id: @order.id).pluck(:production_status)
      if order_detail_params[:production_status] == "2"
        @order.update(order_status: 3)
      end
      if @product_check.all? {|status| status == 3}
        @order.update(order_status: 5)
      end
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  
end
