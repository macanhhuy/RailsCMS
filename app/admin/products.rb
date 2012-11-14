ActiveAdmin.register Product do
  menu :parent => "Shop"
  scope :all, :default => true
  scope :in_stock do |product|
    product.where("created_at < ?", Date.today)
  end
  scope :out_stock do |product|
    product.where("created_at > ?", Date.today)
  end
  
   index :as => :grid do |product|
    div do
      a :href => admin_product_path(product) do
        image_tag(product.image_url,:class => "prod_image",:style => "width: 80px")
      end
    end
    a truncate(product.title), :href => admin_product_path(product)
    br
    span number_to_currency product.price 
  end
  # show :title => :title
# 
  # sidebar :product_stats, :only => :show do
    # attributes_table_for resource do
      # row("Total Sold")  { Order.find_with_product(resource).count }
      # row("Dollar Value"){ number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
    # end
  # end
  # sidebar :recent_orders, :only => :show do
    # Order.find_with_product(resource).limit(5).collect do |order|
      # auto_link(order)
    # end.join(content_tag("br")).html_safe
  # end
end
