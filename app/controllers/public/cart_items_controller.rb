class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
  end
  
  def update
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    
  end
  
  def destroy_all
    
  end
  
  def create
    
  end
  
end
