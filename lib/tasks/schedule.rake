desc 'Reload web app'
task :reload_web do
  HTTP.get('https://cocoa-tree-seeds.herokuapp.com/reload')
end

desc 'Run jobs to update database and then render and deploy the site'
task :schedule => [
  :fetch_specs,
  :jobs,
  :reload_web,
  'rails_zero:generate',
  'rails_zero:deploy:git'
]
