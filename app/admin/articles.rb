ActiveAdmin.register Article do
  menu :parent => "Blog"
  # show do |article|
      # h3 article.title
      # div do
        # simple_format article.body.html_safe
      # end
    # # renders app/views/admin/posts/_some_partial.html.erb
    # #render "some_partial"
   # end
   
   show do |article|
      attributes_table do
        row :title
        row :body do
          simple_format article.body.html_safe
        end
      end
      active_admin_comments
    end
  #filter :author, :label => 'Author'
  #config.sort_order = "name_asc"
  config.per_page = 10
  
  # index :download_links => false do
  # end
  #config.paginate = false
  #filter :title, :as => :check_boxes, :collection => proc { Article.all }
  #menu :priority => 2
  #scope_to :current_admin_user
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
