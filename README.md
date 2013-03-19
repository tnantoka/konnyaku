<img src="https://raw.github.com/tnantoka/konnyaku/master/app/assets/images/icon.png" width="64" />

# Konnyaku

Konnyaku is minimal blog engine for multiple languages, powered by Rails 4.0 and PostgreSQL.

[![Build Status](https://travis-ci.org/tnantoka/konnyaku.png?branch=master)](https://travis-ci.org/tnantoka/konnyaku)
[![Dependency Status](https://gemnasium.com/tnantoka/konnyaku.png)](https://gemnasium.com/tnantoka/konnyaku)
[![Coverage Status](https://coveralls.io/repos/tnantoka/konnyaku/badge.png?branch=master)](https://coveralls.io/r/tnantoka/konnyaku)
[![Code Climate](https://codeclimate.com/github/tnantoka/konnyaku.png)](https://codeclimate.com/github/tnantoka/konnyaku)
[![endorse](http://api.coderwall.com/tnantoka/endorsecount.png)](http://coderwall.com/tnantoka)

## Requirements

* Ruby 2.x
* Ruby on Rails 4.0.beta1
* PostgreSQL 9.x
* [Gems](https://github.com/tnantoka/konnyaku/blob/master/Gemfile)

## Getting Started

### Installation
```
$ git clone git://github.com/tnantoka/konnyaku.git YOUR_BLOG
$ cd YOUR_BLOG/
$ bundle --without test development
```
    
### Database setup
```
$ cp config/database.yml.example config/database.yml
$ YOUR_EDITOR config/database.yml
production:
  username: USERNAME
  password: PASSWORD

$ rake db:create RAILS_ENV=production
$ rake db:migrate RAILS_ENV=production
$ rake db:seed RAILS_ENV=production
```

### Configuration
```
$ cp config/application.yml.example config/application.yml
$ YOUR_EDITOR config/application.yml
```

### Run
```
$ rake assets:precompile
$ rails s -e production
```

## Demo

Coming soon…

## How-to

* [Add a language](https://github.com/tnantoka/konnyaku/wiki)
* [Change the theme](https://github.com/tnantoka/konnyaku/wiki)

## Why reinventing the wheel?

I just want to use Rails 4.0.

## Why PostgreSQL?

I just want to use it.

## TODO

See [issues](https://github.com/tnantoka/konnyaku/issues?state=open).

## License

Konnyaku is released under the MIT license.
  
&copy; 2013 [@tnantoka](https://twitter.com/tnantoka)

