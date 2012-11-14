ActiveAdmin.register Order do
   menu :parent => "Shop"
   scope :all, :default => true
   scope :credit_card do |order|
    order.where("pay_type = ?", "Credit Card")
   end
   scope :check do |order|
    order.where("pay_type = ?", "Check")
   end
   scope :purchase_order do |order|
     order.where("pay_type =?", "Purchase order")
   end
end
