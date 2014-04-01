require 'rails_zero/drivers/poltergeist'

RailsZero.configure do |c|
  c.backend.url = 'http://cocoa-tree-store.herokuapp.com' if Rails.env.production?
  c.deployment.url = 'git@github.com:cocoa-tree/store.git'

  formats = %w[ json mpac ]
  formats.each do |format|
    c.site.add_path "/pods.#{format}"
  end
  c.site.paths_builders = [->{
    chunk_size = PodsController::CHUNK_SIZE
    CocoaPod.all.each_slice(chunk_size).each_with_index.map do |pods, index|
      formats.map do |format|
        "/pods/#{index}.#{format}"
      end
    end.flatten
  }]
end
