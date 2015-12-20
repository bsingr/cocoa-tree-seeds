class CategoriesController < ApplicationController
  caches_page :index

  def index
    categories = CocoaPodCategory.all.to_a.map(&:last).map(&:serializable_hash)
    respond_to do |format|
      format.mpac { render :text => MessagePack.dump(categories) }
      format.json { render json: categories }
    end
  end
end
