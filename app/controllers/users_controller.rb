class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  # before_filter :get_all_objects, :only => [:edit, :new, :update, :create] #get objects for select box
  def index
    begin
    rescue Exception => e
      
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user_name = params[:name]
    @notice = 'User was successfully created'
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
  end

  # GET /users/1/edit
  def edit
    # @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    begin
        # create new user: send name, password and customer_id to Authentication api
        logger.info "creating new user, name:#{params[:user][:name]}, customer_id:#{params[:user][:email]}"                 
        
    rescue Exception => e
      
    end
  end


  # PUT /users/1
  # PUT /users/1.json
  def update
    begin
        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { head :ok }
          else
            format.html { render action: "edit" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    rescue Exception => e
      
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
      begin
          user=User.find(params[:id])
          user.delete

          respond_to do |format|
            format.html { redirect_to users_path}
            format.js {render json: msg}
            # format.json { @res_login['msg'].to_json }
          end
      rescue Exception => e

      end
    end
  end

end