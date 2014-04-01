RailsZero.configure do |c|
  c.backend.url = 'http://cocoa-tree-store.herokuapp.com' if Rails.env.production?
  c.site.add_path '/'
  c.deployment.url = 'git@github.com:cocoa-tree/store.git'
end
