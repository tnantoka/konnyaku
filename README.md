<img src="https://raw.github.com/tnantoka/konnyaku/master/app/assets/images/icon.png" width="96" />

# Konnyaku

Konnyaku is minimal blog engine for multiple languages, powered by Rails 4.0 and PostgreSQL.

[![Build Status](https://travis-ci.org/tnantoka/konnyaku.png?branch=master)](https://travis-ci.org/tnantoka/konnyaku)
[![Dependency Status](https://gemnasium.com/tnantoka/konnyaku.png)](https://gemnasium.com/tnantoka/konnyaku)
[![Coverage Status](https://coveralls.io/repos/tnantoka/konnyaku/badge.png?branch=master)](https://coveralls.io/r/tnantoka/konnyaku)
[![Code Climate](https://codeclimate.com/github/tnantoka/konnyaku.png)](https://codeclimate.com/github/tnantoka/konnyaku)
[![endorse](http://api.coderwall.com/tnantoka/endorsecount.png)](http://coderwall.com/tnantoka)

## Features
* Post with multi langs  
  (Markdown)
* Histories
* File upload
* Categorizing, Tagging
* Search
* Atom feed
* Based on Twitter bootstrap

## Requirements

* Ruby 2.0.x
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

$ RAILS_ENV=production rake db:create db:migrate db:seed
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

* [Live demo](http://demo.konnyaku.tobioka.net/)
* [Developer blog](http://konnyaku.tobioka.net/)

## How-to

* [Change the theme](http://konnyaku.tobioka.net/posts/how-to-change-the-theme)
* [Add a language](http://konnyaku.tobioka.net/posts/how-to-add-a-language)
* [Update](http://konnyaku.tobioka.net/posts/how-to-update-blog-engine)

## Why reinventing the wheel?

I just want to use Rails 4.0.

## Why PostgreSQL?

I just want to use it.

## TODO

See [issues](https://github.com/tnantoka/konnyaku/issues?state=open).

## Contributors

Be the first :-)

## License

Konnyaku is released under the MIT license.
  
&copy; 2013 [@tnantoka](https://twitter.com/tnantoka)

