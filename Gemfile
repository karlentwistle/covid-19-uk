source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'azure-storage-blob', '~> 1.0', '>= 1.0.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'chartkick'
gem 'groupdate'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'roo', '~> 2.8.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
