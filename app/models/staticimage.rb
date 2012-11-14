class StaticImage < ActiveRecord::Base
  image_accessor :page_image
  attr_accessible :page_image
end