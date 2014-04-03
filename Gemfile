ruby '2.1.0'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

group :development, :test do

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

end

group :production do
  # Use PostgreSQL as the database for Active Record
  gem 'pg'

  # 12 Factor App compatibility
  gem 'rails_12factor'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

# ActiveRecord Queries
gem 'squeel'

# Data Format
gem 'msgpack'

# Static Site Deployment 
gem 'rails-zero', '~> 0.2.0'
gem 'poltergeist'

# Remote APIs
gem 'cocoapods-core', github: 'dpree/Core' # rails 4 compatibility
gem 'octokit'
