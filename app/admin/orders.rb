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
   
    form do |f|
      f.inputs "Details" do
        
        f.select :pay_type, Order::PAYMENT_TYPES,
                  :prompt => 'Select a payment method'
        #f.input :image, :as => :file
      
      end
       f.inputs "Status" do
        
        f.select :status, Order::STATUS,
                  :prompt => 'Status'
        #f.input :image, :as => :file
      
      end
     f.inputs "Details2" do
        
   
       f.input :name

        f.input :address
        f.input :email
      end
      f.buttons

    end
end
