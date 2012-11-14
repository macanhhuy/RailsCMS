class Article < ActiveRecord::Base
  attr_accessible :body, :title, :cached_slug
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  has_many :comments, :dependent => :destroy
  #belongs_to :user
  
end
