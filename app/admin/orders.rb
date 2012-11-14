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
        f.input :title
        #f.input :image, :as => :file
       
      end
      f.inputs "Content" do
        f.input :body, :input_html => {:class => "ckeditor"}
      end
      f.buttons
    end
end
