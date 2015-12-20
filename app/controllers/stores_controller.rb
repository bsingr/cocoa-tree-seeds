class StoresController < ApplicationController
  def reload
    reload_store
    render text: 'ok'
  end
end
