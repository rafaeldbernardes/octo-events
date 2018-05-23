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

The project will serve in port 3000.

To run the tests, run the following:
```sh
$ rspec
```

### Linux 64 Bits

Installing Ruby on Ubuntu:
  * [RVM](https://rvm.io/)

Installing PostgreSQL 9.6 via Docker:

```sh
$ docker pull sameersbn/postgresql:9.6-2
$ docker build -t sameersbn/postgresql github.com/sameersbn/docker-postgresql
$ docker run --name postgresql -itd --restart always --env 'PG_PASSWORD=passw0rd' sameersbn/postgresql:9.6-2 (SET PASSWORD)
```

## Up and running

Inside folder's project, run:
```sh
$ gem install bundler
$ bundle install (could take a while)
$ rake db:create
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
$ rails s
```
