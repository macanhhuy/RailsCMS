class Product < ActiveRecord::Base
  default_scope :order => 'title'
  attr_accessible :description, :image_url, :price, :title
  validates :title, :uniqueness => true
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  def ensure_not_referenced_by_any_line_item 
    if line_items.empty?
      return true 
    else
        errors.add(:base, 'Line Items present')
      return false 
    end
  end
  validates :image_url, :format => {
  :with    => %r{\.(gif|jpg|png)$}i,
  :message => 'must be a URL for GIF, JPG or PNG image.'
  
}
end
