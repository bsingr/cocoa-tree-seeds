class CocoaPodsCategoriesController < ApplicationController
  def index
    render json: CocoaPodsCategoriesExport.new.json
  end
end
