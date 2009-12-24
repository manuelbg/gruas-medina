class CountiesController < ApplicationController
  def index
    if !params[:state_id]
      params[:state_id] = 19
    end
    @counties = County.find_all_by_state_id(params[:state_id])
    respond_to do |format|
      format.js {  }
    end
  end

end
