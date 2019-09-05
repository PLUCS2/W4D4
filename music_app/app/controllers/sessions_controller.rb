class SessionsController < ApplicationController 

  def new
    render :new
  end 

  def create 
    #debugger
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    #debugger 
    if user 
      login!(user)
      redirect_to user_url(user)
    else 
      flash.now[:errors] = [ "that login information was incorrect" ]
      render :new 
    end 
  end 

  def destroy 
    #debugger
    logout!(@user)
    redirect_to new_session_url
  end 

end  