class BandsController < ApplicationController

    # [:new, :create, :destroy, :show, :update, :edit, :index]

    def new
      render :new 
    end 

    def create
      # debugger
      @band = Band.new(band_params)
      if @band.save 
        # debugger
        # @band = Band.find_by(name: band_params[:name])
        redirect_to band_url(@band)
      else 
        flash.now[:errors] = [ @band.errors.full_messages ]
        render :new #new_band_url
      end 
    end 
    
    def destroy
      band = Band.find(params[:id])
      if band 
        name = band.name
        band.destroy 
        flash[:errors] = [ "#{name} was deleted from the database"]
        redirect_to bands_url
      else 
        flash.now[:errors] = [ "This band does not exist in this database"]
        render :index
      end 
    end 

    def show 
      # debugger
      @band = Band.find(params[:id])
      if @band 
        render :show
      else 
        flash.now[:errors] = [ "This band does not exist in this database"]
        render :index
      end 
    end 

    def update
      @band = Band.find(params[:id])
      if @band.update(band_params)
        flash[:errors] = [ "#{@band.name} was updated"]
        redirect_to band_url(@band)
      else 
        flash.now[:errors] = [ @band.errors.full_messages ]
        render :edit
      end 
    end 

    def edit
      @band = Band.find(params[:id])
      if @band 
        render :edit 
      else 
        render plain: "That band does not exist in this system"
      end 
    end 

    def index 
      @band = Band.all 
      render :index 
    end 

    private 

    def band_params
      params.require(:band).permit(:name)
    end 
end 