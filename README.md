## Requirements
  * Ruby 2.5.1
  * Rails 5.1.5

## Routes

```rb
# == Route Map
#
#       Prefix Verb URI Pattern                        Controller#Action
# issue_events GET  /issues/:issue_id/events(.:format) events#index {:formats=>:json}
#       events POST /events(.:format)                  events#create {:formats=>:json}
```

## Installation Instructions

### Linux 64 Bits

Installing Ruby on Ubuntu:
  * [RVM](https://rvm.io/)

## Up and running

Inside folder's project, run:
```sh
$ docker-compose up

$ gem install bundler
$ bundle install (could take a while)

$ rake db:create
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
$ rails s
```

The project will serve in port 3000.

To run the tests, run the following:
```sh
$ rspec
```

## Tested

This app was tested with ngrok:

```sh
$ ./ngrok http 3000
```

And Postman:

In development environment : localhost:3000/issues/2/events