# Jungle

A mini e-commerce application built with Rails 4.2 with additional new features implemented.

## Final Product
!["Screenshot of sold-out-badge"](https://github.com/kelvin8wong/jungle-rails/blob/master/docs/sold-out-badge.png?raw=true)

!["Screenshot of product-rating"](https://github.com/kelvin8wong/jungle-rails/blob/master/docs/product-rating.png?raw=true)

!["Screenshot of empty-cart"](https://github.com/kelvin8wong/jungle-rails/blob/master/docs/empty-cart.png?raw=true)

!["Screenshot of order-details"](https://github.com/kelvin8wong/jungle-rails/blob/master/docs/order-details.png?raw=true)

!["Screenshot of email-receipt"](https://github.com/kelvin8wong/jungle-rails/blob/master/docs/email-receipt.png?raw=true)
## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Authors
Kelvin Wong 

## Acknowledgments
Lighthouse Lab Mentors
