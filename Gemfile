source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'pundit'
gem "twitter-bootstrap-rails"
gem 'bootstrap_form'
gem 'mini_magick'
gem 'carrierwave', '~> 1.0'
gem 'delayed_job_active_record'
gem 'faker', '~> 1.7'
gem 'kaminari'
gem 'pg_search'
gem 'figaro'
gem 'friendly_id'
gem 'gravatar_image_tag'
gem 'cocoon'
gem 'stripe'
gem 'daemons'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]