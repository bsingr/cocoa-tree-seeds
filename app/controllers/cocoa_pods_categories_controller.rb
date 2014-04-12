class CocoaPodsCategoriesController < ApplicationController
  def index
    render json: CocoaPodsCategoriesDump.new.json
  end
end
