class Order < ApplicationRecord
  
  attr_accessor :select_option,:user

  @user_full_name = "current_user.last_name" + " " + "current_user.first_name"
    
  belongs_to :user
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
