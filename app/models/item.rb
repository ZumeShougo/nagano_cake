class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy
  attachment :image
  belongs_to :genre
    
  enum sales_status: { on_sale: 0, off_sale: 1 }
  
  
  
end
