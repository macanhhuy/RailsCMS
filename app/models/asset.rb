class Asset < ActiveRecord::Base
  class Asset < ActiveRecord::Base
#path is generally set by default, but i had to set mine
has_attached_file :data, :url => "/assets/:id", :path => ":rails_root/public/system/assets/:id/:basename.:extension"
 
belongs_to :attachable, :polymorphic => true
 
#Set number to the Max Attachments allowed for owner
Max_Attachments = 5
Max_Attachment_Size = 2.megabyte
 
def url(*args)
data.url(*args)
end
 
def name
data_file_name
end
 
def content_type
data_content_type
end
 
def file_size
data_file_size
end
end
 
#in the model that is going to have the attachments added to it.
has_many :assets, :as => :attachable, :dependent => :destroy
accepts_nested_attributes_for :assets
 
validate :validate_attachments
def validate_attachments
errors.add_to_base("Too many attachments - maximum is #{Asset::Max_Attachments}") if assets.length > Asset::Max_Attachments
assets.each {|a| errors.add_to_base("#{a.name} is over #{Asset::Max_Attachment_Size/1.megabyte}MB") if a.file_size > Asset::Max_Attachment_Size}
end
end
