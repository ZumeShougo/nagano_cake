class CartItem < ApplicationRecord
  
  belongs_to :user
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

  def tax_in
    
  end
  
end
