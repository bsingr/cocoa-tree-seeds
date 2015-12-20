class CategoriesController < ApplicationController
  caches_page :index

  def index
    categories = CocoaPodCategory.all.to_a
    respond_to do |format|
      format.mpac { render :text => MessagePack.dump(categories.map(&:serializable_hash)) }
      format.json { render json: categories }
    end
  end
end
