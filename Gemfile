source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'

gem 'puma', '~> 3.11'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'devise', '~> 4.2'
gem 'aws-sdk-s3'

gem 'mini_magick', '~> 4.8'

gem 'globalize', git: 'https://github.com/globalize/globalize'
gem 'activemodel-serializers-xml'

gem 'kramdown', '~> 1.16', '>= 1.16.2'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 0.55.0', require: false
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end

group :production do
  gem 'pg'
  gem 'mailgun-ruby', '~>1.1.6', require: 'mailgun'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
