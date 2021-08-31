source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails', '~> 6.0.3', '>= 6.0.3.7'

# Database
gem 'mysql2', '>= 0.4.4'

# App server
gem 'puma', '~> 4.1'

# Assets
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Authentication
gem 'sorcery'

# Configuration
gem 'dotenv-rails'

# Serializer
gem 'fast_jsonapi'

# UI/UX
gem 'rails-i18n', '~> 6.0.0' 

# Management portal
gem 'activeadmin'

group :development, :test do
  # Debugger
  gem 'byebug'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'

  # Print debug
  gem 'hirb'
  gem 'hirb-unicode-steakknife'

  # Code analyze
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false

  # Table/Schema
  gem 'annotate'

  # Test
  gem 'rspec-rails', '~> 5.0.0'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'

  # CLI
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
