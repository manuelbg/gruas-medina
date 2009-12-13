class CarTypesController < ApplicationController
  def index
    @car_types = CarType.all
  end
  
  def show
    @car_type = CarType.find(params[:id])
  end
  
  def new
    @car_type = CarType.new
  end
  
  def create
    @car_type = CarType.new(params[:car_type])
    if @car_type.save
      flash[:notice] = "Successfully created car type."
      redirect_to @car_type
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
      flash[:notice] = "Successfully updated car type."
      redirect_to @car_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @car_type = CarType.find(params[:id])
    @car_type.destroy
    flash[:notice] = "Successfully destroyed car type."
    redirect_to car_types_url
  end
end
