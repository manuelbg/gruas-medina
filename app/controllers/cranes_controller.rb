class CranesController < ApplicationController
  def index
    @cranes = Crane.all
  end
  
  def show
    @crane = Crane.find(params[:id])
  end
  
  def new
    @crane = Crane.new
  end
  
  def create
    @crane = Crane.new(params[:crane])
    if @crane.save
      flash[:notice] = "Se creo la grua <strong>#{@crane.name}</strong>."
      redirect_to cranes_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @crane = Crane.find(params[:id])
  end
  
  def update
    @crane = Crane.find(params[:id])
    if @crane.update_attributes(params[:crane])
      flash[:notice] = "Se modifico la grua <strong>#{@crane.name}</strong>."
      redirect_to cranes_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @crane = Crane.find(params[:id])
    @crane.destroy
    flash[:notice] = "Se elimino la grua <strong>#{@crane.name}</strong>."
    redirect_to cranes_path
  end
end
