class TinymceAssetsController < ApplicationController
  def create
    @datafile = DataFile.create(file: params[:file])

    render json: {
      image: {
        url: @datafile.file.url
      }
    }
  end
end