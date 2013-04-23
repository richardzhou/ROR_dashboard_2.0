source 'https://rubygems.org'

#gem 'rails', '3.2.12'
gem 'rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 3.2.3'
  #gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
gem 'yajl-ruby', :require => 'yajl' # 'yajl-ruby' is mush faster than rails' built-in JSON parser->ActiveSupport JSON

# Use unicorn as the app server
gem 'unicorn'
gem 'unicorn-rails'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

# To use debugger
# gem 'debugger'

gem 'httparty'

gem 'foreman'

gem 'annotate', '~>2.5.0'

group :test, :development do
  gem "rspec", "~> 2.0"
  gem "rspec-rails", "~> 2.0"
  gem "factory_girl_rails", "~> 4.0"
end