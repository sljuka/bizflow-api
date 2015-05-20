source 'https://rubygems.org'


gem 'rails', '4.1.1'

gem 'rails-api'

gem 'spring', :group => :development


gem 'sqlite3'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# gem 'bizflow', :path => "~/projects/bizflow"
gem 'bizflow'

gem 'rb-readline'

gem 'byebug'

group :production do
  gem 'mysql2'
end

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'selenium-webdriver'
end

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
