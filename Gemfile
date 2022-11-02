source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'


# for Heroku deployment 
group :development, :test do
  gem 'sqlite3', '1.3.11'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'ZenTest', '4.11.2'
end

gem 'factory_bot_rails'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', :require => false
end
group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'jquery-rails'
gem 'bcrypt'
