class Order < ActiveRecord::Base
  attr_accessible :email, :address, :name, :pay_type, :status
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  STATUS = ["Pending", "Completed", "Canceled"]
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  validates :status, :inclusion => STATUS
  has_many :line_items, :dependent => :destroy
  
  def add_line_items_from_cart(cart) 
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end 
  end
end
