# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

This project was focused on learning a new language (Ruby) while also completing tasks revolved around it. We had only a few days to learn the basics of Ruby and Rails before we had to start on this project. The project simulated the real world, where our learning and development skills are tested while on the job. We had to add features on top of the already built website, and fix bugs that were apart of the site.

Overall, learning Ruby and Rails was a fun process. Doing mini assignments while looking over the codebase was a cool experience, and something that seems relevant in actual jobs. It taught me to reserach more in depth, and figure out some tips and tricks on my own.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
