ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
  
  action_item do
      link_to "View Site", "/"
  end
     
  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
    
    columns do
      
      column do
        
        panel "Recent Orders" do
          
          table_for Order.order('id desc').limit(10) do
            column("Name")   {|order| link_to(order.name, admin_order_path(order))     } 
            column("Email"){|order| order.email } 
            column("Paytype")   {|order| status_tag(order.pay_type)} 
          end
        end
      end

      column do
        panel "Recent Products" do
          table_for Product.order('id desc').limit(10) do
            column("Title")   {|product| link_to(product.title,  admin_product_path(product))    } 
            column("Image"){|product| link_to(image_tag(product.image_url,:class => "prod_image",:style => "width: 80px"), admin_product_path(product)) } 
            column("Price")   {|product| number_to_currency product.price  } 
          end
         
        end
        
         panel "Recent Articles" do
          table_for Article.order('id desc').limit(10) do
            column("Title")   {|article| article.title     } 
            column("Body"){|article| article.body.html_safe } 
           end
         
        end
      end
      column do
        panel "Charts" do
          render('/admin/charts', :model => 'orders')
          
        end
      end

    end # columns

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
