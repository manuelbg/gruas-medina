class NeighbourhoodsController < ApplicationController
  def index
    @county = County.find_by_name(params[:county_name])
    @neighbourhoods = Neighbourhood.find_all_by_county_id(@county.id)
    respond_to do |format|
      format.js {  }
    end
  end
end
