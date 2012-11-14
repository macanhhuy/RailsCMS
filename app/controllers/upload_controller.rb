class UploadController < ApplicationController
  protect_from_forgery :only => [:create, :update, :destroy] 

  def index
     render :file => 'app/views/upload/uploadfile.html.erb'
  end
end
