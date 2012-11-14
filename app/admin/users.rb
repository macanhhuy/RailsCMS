ActiveAdmin.register User, :as => "Customer" do
  config.batch_actions = true

  filter :name
  filter :created_at
  index do |user|
    div "Welcome"
    selectable_column
    id_column
    column :name
    column :created_at
    default_actions
  end
  
  show :title => :name do
    
    panel "Order History" do
      table_for Order.order('id desc').limit(10) do
        column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
      end
    end
    active_admin_comments
  end

  sidebar "Customer Details", :only => :show do
    attributes_table_for customer, :name, :created_at
  end

  sidebar "Order History", :only => :show do
    attributes_table_for customer do
      row("Total Orders") { }
     
    end
  end
   sidebar "Active Admin Demo" do
    render('/admin/sidebar_links', :model => 'orders')
  end
end
