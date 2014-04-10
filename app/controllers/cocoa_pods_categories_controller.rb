class CocoaPodsCategoriesController < ApplicationController
  def index
    render json: CocoaPodCategoriesDump.new.json
  end
end
