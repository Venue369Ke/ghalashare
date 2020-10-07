class PhotosController < ApplicationController

  def create

    @warehouse= Warehouse.find(params[:warehouse_id])



    if params[:images]

      params[:images].each do |img|

        @warehouse.photos.create(image: img)



      end

      @photos =@warehouse.photos

      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end



  end



  def destroy
    @photo=Photo.find(params[:id])
    @warehouse = @photo.warehouse


    @photo.destroy



    @photos=Photo.where(warehouse_id: @warehouse.id)

    respond_to :js

  end
end
