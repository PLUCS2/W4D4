class AlbumsController <ApplicationController

  def new 
    render :new 
  end 

  def create
    @album = Album.new(album_params)
    
    if @album.save
      flash[:errors] = ["#{@album.title} was added to the database"]
      redirect_to band_url(@album.band_id)
    else 
      flash.now[:errors] =[ "Album was not added to the database" ]
      render :new 
    end 
  end 
  
  def show 
    @album = Album.find(params[:id])
    if @album
      render :show 
    else 
      flash[:errors] = [ "This album was not found" ]
      redirect_to bands_url
    end 
  end 

  def edit 
    @album = Album.find(params[:id])
    if @album 
      render :edit 
    else 
      flash[:errors] = ["This album cannot be edited or does not exist"]
      redirect_to bands_url 
    end 
  end 

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash.now[:errors] = [ "#{@album.name} was updated"]
      render :show 
    else 
      flash.now[:errors] = [ "This album was not properly updated" ]
      render :edit 
    end  
  end 

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy 
      flash[:errors] = [ "The album was removed from the database" ]
      redirect_to band_url(params[:band_id])
    else 
      flash.now[:errors] = [ "This album could not be removed from the database" ]
      render :show 
    end 
  end 

  private 

  def album_params 
    params.require(:album).permit(:title, :band_id, :recordings, :year, :band_id) 
  end 

end 