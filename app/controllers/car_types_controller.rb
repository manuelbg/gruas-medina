class CarTypesController < ApplicationController
  before_filter :only_admin
  before_filter :load_brand, :except => :like_options
  
  def index
    @car_types = @car_brand.car_types
  end
  
  def show
    @car_type = CarType.find(params[:id])
  end
  
  def new
    @car_type = CarType.new
  end
  
  def create
    @car_type = @car_brand.car_types.build(params[:car_type])
    if @car_type.save
      flash[:notice] = "Se creo el vehículo <strong>#{@car_brand.name} #{@car_type.name}</strong>."
      redirect_to car_brand_car_types_path(@car_brand)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @car_type = CarType.find(params[:id])
  end
  
  def update
    @car_type = CarType.find(params[:id])
    if @car_type.update_attributes(params[:car_type])
      flash[:notice] = "Se modifico el vehículo <strong>#{@car_brand.name} #{@car_type.name}</strong>."
      redirect_to car_brand_car_types_path(@car_brand)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @car_type = CarType.find(params[:id])
    @car_type.destroy
    flash[:notice] = "Se elimino el vehículo <strong>#{@car_brand.name} #{@car_type.name}</strong>."
    redirect_to car_brand_car_types_path(@car_brand)
  end
  
  def like_options
    @car_types = CarType.find(:all, :conditions => ["car_brand_id = ?", params[:car_brand_id]])
    render :layout => 'ajax'
  end
  
  protected
  def load_brand
    @car_brand = CarBrand.find(params[:car_brand_id])
  end
end
