source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'dotenv-rails'
gem 'haml-rails', '0.9.0'
gem 'autoprefixer-rails', '6.3.4'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver' # , '2.35.1'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'gemsurance'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara-screenshot'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
