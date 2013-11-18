source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.13'
group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'sass-rails',   '~> 3.2.3'
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'bootstrap-sass-rails'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'haml-rails'
gem 'rolify'
gem 'simple_form'
gem 'thin'
group :assets do
  gem 'therubyracer', :platform=>:ruby
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end

gem 'omniauth'
gem 'omniauth-facebook'
gem 'unidecode'

# Amazon S3!
gem 'paperclip'
gem 'aws-sdk'
