[![Build Status](https://travis-ci.org/zekus/i18n-mongodb.svg)](https://travis-ci.org/zekus/i18n-mongodb)

# I18n::Mongodb

a simple Rails I18n backend using MongoDB

## Installation

Add this line to your application's Gemfile:

    gem 'i18n-mongodb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-mongodb

## Usage

Create an initializer `config/initializers/i18n_backend.rb` and copy/adjust the code below:

```ruby
require 'i18n/backend/mongodb'

session = Moped::Session.new(["127.0.0.1:27017"]).use(:i18n)
collection = session[:translations]
I18n.backend = I18n::Backend::Mongodb.new(collection)
```

## Contributing

1. Fork it ( http://github.com/zekus/i18n-mongodb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
