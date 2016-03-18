# EasyTokens
[![](https://img.shields.io/gem/v/easy_tokens.svg?style=flat-square)](http://rubygems.org/gems/easy_tokens)
[![](http://img.shields.io/gemnasium/lubieniebieski/easy_tokens.svg?style=flat-square)](https://gemnasium.com/lubieniebieski/easy_tokens)

## General info

EasyTokens provide an interface for tokens management and also their verification in your Rails 4 app. You can issue a token for external app/users and verify this token presence in a given context.

## Installation

Mount EasyTokens engine in your routes:

```ruby
mount EasyTokens::Engine, at: '/et'
```

Install required migrations:

```shell
bin/rake easy_tokens:install:migrations
bin/rake db:migrate
```

## Usage

Go to engine route in your app - i.e. `http://myapp.com/et`.
Generate token for your client. From now on - you can add token to resource in
order to get it in the following way:

```
http://myapp.com/my_resources?token=generated_token
```
#### Rails API

All you need to verify your controller resources is:

```ruby
check_token_on :foo, :bar, :baz
```

1. Engine checks if `params` contain `token` attribute
1. Token is validated against database
1. If token is valid then the requested resource is returned, otherwise it
   return `400` (no token) or `401` (invalid token) response

#### Grape API

You need to include EasyTokens helper to your resource class:

```ruby
class MyAPI < Grape::API
   ...
   helpers EasyTokens::Grape
   ...
end
```

If you have multiple helper files or you define helpers in resource file, you must do it in that way:

```ruby
# Correct way
class MyAPI < Grape::API
   ...
   helpers do 
      include EasyTokens::Grape
      include MyOtherHelper
      
      def my_local_helper
         true
      end
   end
   ...
end

# Wrong way
class MyAPI < Grape::API
   ...
   helpers EasyTokens::Grape # It will be overwritten
   helpers MyOtherHelper # It will be overwritten
      
   helpers do
      def my_local_helper
         true
      end
   end
end
```

Now just call appropriate function in 'before' block:

```ruby
before do
   check_api_token(params[:token])
end
```

## Configuration

If you want to override EasyTokens settings, create an initializer in your Rails App:

```ruby
# config/initializers/easy_tokens.rb
EasyTokens.token_owner_method = 'current_user'
EasyTokens.token_owner_class = 'User'
EasyTokens.owner_authorization_method = 'admin?'
```

## Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative
implementation, or build an application that is similar, please contact
me and I’ll add a note to the README so that others can find your work.

## License

MIT - see license
