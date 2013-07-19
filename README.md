# upfrontwichita.com

The web home for UpFront Wichita

# Requirements
* Ruby 2
* Rails 3.2

For Linux and Mac you can meet these requirements by running `curl -L https://get.rvm.io | bash -s stable --rails`

# Local setup
* Clone this repo and switch in to it
* Install dependencies by running `bundle install --without=production`
* Start serving up the app with `rails server`
* Browse to http://localhost:3000

# Production deployment
    cap deploy:setup
    cap deploy:check
    cap deploy:cold
