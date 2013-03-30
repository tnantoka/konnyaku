source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.beta1'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'less-rails', '2.3.2'
  gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git', ref: '679fc6ee91'
  gem 'jquery-fileupload-rails', '0.4.1'
  gem 'jquery-turbolinks', '0.2.1' 
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'

group :development, :production do
  gem 'pry-rails'
  gem 'awesome_print'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'simplecov', require: false
  gem 'launchy'
  #gem 'factory_girl_rails'
  gem 'fuubar'
  gem 'coveralls', require: false
end
#gem 'mail_view'

gem 'thin', '1.5.1'
gem 'settingslogic', '2.0.9'
gem 'redcarpet', '2.2.2'
gem 'kaminari', '0.14.1'
gem 'truncate_html', git: 'git://github.com/hgmnz/truncate_html.git', ref: '37d65c8489'
gem 'carrierwave', '0.8.0' 
gem 'paper_trail', git: 'git://github.com/airblade/paper_trail.git', ref: '009d3bd4a3'
gem 'diffy', '2.1.3'
gem 'arigato_rails'
