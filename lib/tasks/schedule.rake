desc 'Run jobs to update database and then render and deploy the site'
task :schedule => [
  'dropbox:load',
  :jobs,
  'rails_zero:generate',
  'rails_zero:deploy:git',
  'dropbox:store'
]
