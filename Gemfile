source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production do
end

group:development, :production do
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.0.5'
end

 group :development, :test do
   gem 'rspec-rails'
   gem 'shoulda'
   gem 'factory_bot_rails'
   gem 'simplecov'
   gem 'pry-rails'
   #allows for view render testing.
   gem 'rails-controller-testing'
   gem 'vcr' #records responses onto cassette tapes
 end

 group :test do
   gem 'database_cleaner'
 end

gem 'pg'
gem 'rails_12factor'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use jquery as the JavaScript library
gem 'jquery-rails'
#
gem 'bootstrap-sass', '3.3.6'

#used for creating user authentication
gem 'devise'
#enables yaml files,
gem 'figaro'

#allows for a scalable authorization system for roles using policy/ scopes
gem 'pundit'

# Use redcarpet for allowing markdown syntax
gem 'redcarpet'

#allows for an imported theme. add it to
gem 'bootswatch-rails'

gem 'faker'
#used for making graphs
gem 'chartkick'
#helps group by date
gem 'groupdate'
