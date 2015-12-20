desc 'Run jobs to update database and then render and deploy the site'
task :schedule => [
  :fetch_specs,
  :jobs,
  'rails_zero:generate',
  'rails_zero:deploy:git'
]
