ActiveAdmin.register Blog, :as => "Page"  do
  #menu :label => "News in Nav"
  #menu :label => proc{ I18n.t("mypost") } translate label at runtime
  menu :parent => "Blog"
  #menu :if => proc{ current_admin_user.can_edit_posts? }
end
