class OperatorsController < ApplicationController
  def index
    @operators = Operator.all
  end
  
  def show
    @operator = Operator.find(params[:id])
  end
  
  def new
    @operator = Operator.new
  end
  
  def create
    @operator = Operator.new(params[:operator])
    if @operator.save
      flash[:notice] = "Se creo el operador <strong>#{@operator.name}</strong>."
      redirect_to operators_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @operator = Operator.find(params[:id])
  end
  
  def update
    @operator = Operator.find(params[:id])
    if @operator.update_attributes(params[:operator])
      flash[:notice] = "Se modifico el operador <strong>#{@operator.name}</strong>."
      redirect_to operators_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @operator = Operator.find(params[:id])
    @operator.destroy
    flash[:notice] = "Se elimino el operador <strong>#{@operator.name}</strong>."
    redirect_to operators_path
  end
end
