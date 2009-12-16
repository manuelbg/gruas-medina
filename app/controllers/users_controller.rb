class UsersController < ApplicationController
 
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(params[:user])
    @user.role = 'user'
    if @user.save
      flash[:notice] = "El cliente se creó con exito."
      redirect_to users_path
    else
      flash[:error]  = "Ocurrio un error al crear al cliente."
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "El cliente se modificó con exito."
      redirect_to users_path
    else
      flash[:error]  = "Ocurrio un error al modificar al cliente."
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "El cliente se eliminó con exito."
    else
      flash[:error]  = "Ocurrio un error al eliminar al cliente."
    end
    redirect_to users_path
  end
end
