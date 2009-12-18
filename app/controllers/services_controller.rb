class ServicesController < ApplicationController
  before_filter :login_required
  
  def index
    @services = Service.find(:all, :order => 'start_date DESC')
  end
  
  def show
    @service = Service.find(params[:id])
  end
  
  def new
    @service = Service.new
  end
  
  def create
    @service = Service.new(params[:service])
    if @service.save
      flash[:notice] = "Successfully created service."
      redirect_to @service
    else
      render :action => 'new'
    end
  end
  
  def edit
    @service = Service.find(params[:id])
  end
  
  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      flash[:notice] = "Successfully updated service."
      redirect_to @service
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:notice] = "Successfully destroyed service."
    redirect_to services_url
  end
end
