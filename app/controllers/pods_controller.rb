class PodsController < ApplicationController
  caches_page :index, :show

  CHUNK_SIZE = 500

  def index
    @pods = CocoaPod.all.to_a
    pods_index = CocoaPod.all.to_a.each_slice(CHUNK_SIZE).each_with_index.map do |pods, index|
      [index, pods.map(&:name)]
    end
    respond_to do |format|
      format.mpac { render :text => MessagePack.dump(pods_index) }
      format.json { render json: pods_index }
    end
  end

  def show
    data = CocoaPod.all.to_a.each_slice(CHUNK_SIZE).to_a
    @pods = data[params[:id].to_i]
    respond_to do |format|
      format.mpac { render :text => MessagePack.dump(@pods.map(&:serializable_hash)) }
      format.json { render json: @pods }
    end
  end
end
