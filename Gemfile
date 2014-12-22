source 'https://rubygems.org'

gem "puma"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

gem "rails-i18n"
gem "activeadmin", github: "gregbell/active_admin" # Until it's 1.0.0
gem "devise"
gem "postgres_ext"
gem "pg_search"
#gem "schema_plus"

gem "active_model_serializers"
gem "grape"
#gem "grape-active_model_serializers"
gem "grape-entity"
#gem 'grape-swagger', github: 'tim-vandecasteele/grape-swagger'
#gem "grape-swagger-rails", github: 'BrandyMint/grape-swagger-rails'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem "rack-cors", require: "rack/cors"

gem 'rails_12factor', group: :production

gem 'valid_email', require: ['valid_email/all_with_extensions']

group :development do
  gem "better_errors"
  gem "meta_request"
  gem "quiet_assets"
  gem "rails-erd"
end

group :development, :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "faker"
  gem "poltergeist"
  gem "pry-nav"
  gem "pry-rails"
  gem "pry-stack_explorer"
  gem "pry-theme"
  gem "rspec-rails"
  gem "rubocop"
  gem "shoulda-matchers"
  gem "spring-commands-rspec"
end

ruby "2.1.2"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

