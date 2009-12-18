class ServiceTypesController < ApplicationController
  def index
    @service_types = ServiceType.all
  end
  
  def show
    @service_type = ServiceType.find(params[:id])
  end
  
  def new
    @service_type = ServiceType.new
  end
  
  def create
    @service_type = ServiceType.new(params[:service_type])
    if @service_type.save
      flash[:notice] = "Se creo el sub-servicio <strong>#{@service_type.name}</strong>."
      redirect_to service_types_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @service_type = ServiceType.find(params[:id])
  end
  
  def update
    @service_type = ServiceType.find(params[:id])
    if @service_type.update_attributes(params[:service_type])
      flash[:notice] = "Se modifico el sub-servicio <strong>#{@service_type.name}</strong>."
      redirect_to service_types_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @service_type = ServiceType.find(params[:id])
    @service_type.destroy
    flash[:notice] = "Se elimino el sub-servicio <strong>#{@service_type.name}</strong>."
    redirect_to service_types_path
  end
end
