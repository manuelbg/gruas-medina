class CarBrandsController < ApplicationController
  def index
    @car_brands = CarBrand.all
  end
  
  def show
    @car_brand = CarBrand.find(params[:id])
  end
  
  def new
    @car_brand = CarBrand.new
  end
  
  def create
    @car_brand = CarBrand.new(params[:car_brand])
    if @car_brand.save
      flash[:notice] = "Se creo la marca <strong>#{@car_brand.name}</strong>."
      redirect_to car_brands_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @car_brand = CarBrand.find(params[:id])
  end
  
  def update
    @car_brand = CarBrand.find(params[:id])
    if @car_brand.update_attributes(params[:car_brand])
      flash[:notice] = "Se modifico la marca <strong>#{@car_brand.name}</strong>."
      redirect_to car_brands_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @car_brand = CarBrand.find(params[:id])
    @car_brand.destroy
    flash[:notice] = "Se elimino la marca <strong>#{@car_brand.name}</strong>."
    redirect_to car_brands_path
  end
end
