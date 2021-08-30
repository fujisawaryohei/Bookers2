source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.4', '>= 5.2.4.2'

gem 'bootsnap', require: false

gem 'sqlite3'
# TODO: リポジトリ提出時には削除する
gem 'pg'

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

group :development, :test do
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'factory_bot_rails'
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  # gem 'faker'
end

group :production do
  # TODO: インストールされないので一旦Postgresqlで本番環境作る
  # gem 'mysql2'
  gem 'dotenv-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
