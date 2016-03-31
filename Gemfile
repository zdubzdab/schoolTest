source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use SCSS for stylesheets
gem "rails"
gem "devise"
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem 'carrierwave-video', github: 'begin29/carrierwave-video'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem "grape", "~> 0.12"
gem 'grape-active_model_serializers'
gem 'grape-entity', github: 'intridea/grape-entity'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem "font-awesome-rails"
gem 'slim-rails', '~> 3.0'
gem 'paper_trail'
gem 'pg'
gem 'thin', group: :development
gem 'cancancan'
gem 'progress_bar'
gem 'friendly_id', '>= 5.0'
gem "rolify"
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'carrierwave-dropbox', github: 'begin29/carrierwave-dropbox'
gem 'dropbox-sdk'
gem 'rmagick'
gem 'will_paginate'
gem 'ransack'
gem 'routing-filter'
gem 'kaminari'
gem 'sprockets-rails', '~> 2'
gem "i18n-js", ">= 3.0.0.rc11"
gem 'rmega'
gem "carrierwave-mega", :git => "git://github.com/zdubzdab/carrierwave-mega.git"
gem "gretel"

group :assets do
  gem "coffee-rails"
end

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'better_errors'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'pry'
end

group :production do
  gem 'puma'
  gem "rack-timeout"
end
