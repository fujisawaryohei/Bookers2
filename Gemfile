source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.4', '>= 5.2.4.2'

gem 'bootsnap', require: false

gem 'sqlite3'

gem 'puma', '~> 3.0'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'capistrano-rails', group: :development

gem 'devise'

gem 'seed-fu'

gem 'bootstrap', '~> 4.5'

gem 'font-awesome-sass', '~> 5.13'

gem 'refile', require: 'refile/rails', github: 'manfe/refile'

gem 'refile-mini_magick'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'letter_opener_web'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
end

group :production do
  # TODO: インストールされないので一旦Postgresqlで本番環境作る
  gem 'dotenv-rails'
  gem 'mysql2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
