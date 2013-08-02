class LoginController < ApplicationController
  skip_before_filter :check_access  

  def index
    @login=nil
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json:}
    end
  end
  
  def create
    begin
        @user = User.find_by_email(params[:email]) 
        if @user
          logger.debug "User #{@user.name]} login"
          session[:user_id] = @user.id
          session[:user_name] = @user.name
      
          redirect_to tasks_index_path
        else
          logger.debug "login failed"
          flash[:error] = "incorrect email"
          redirect_to login_index_path
        end
    rescue Exception => e
      logger.debug e.inspect
    end
  end
  
  def destroy
    logger.debug "User #{session[:user].inspect} logout"
    session[:user_id] = nil
    # Rails.cache.clear
    session[:user_name] = nil
    redirect_to login_index_url
  end
  
end