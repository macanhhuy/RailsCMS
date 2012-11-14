ActiveAdmin.register Product do
  menu :parent => "Shop"
  scope :all, :default => true
  scope :in_stock do |product|
    product.where("created_at < ?", Date.today)
  end
  scope :out_stock do |product|
    product.where("created_at > ?", Date.today)
  end
end
