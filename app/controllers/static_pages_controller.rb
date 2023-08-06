class StaticPagesController < ApplicationController

  def index 
    if params[:flickr_id].present?
      API.get_data(params[:flickr_id])
    end
  end

  private

  def flickr_params
    params.permit(:flickr_id)

  end 



end
