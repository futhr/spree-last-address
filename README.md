# Spree Last Address

[![Build Status](https://secure.travis-ci.org/futhr/spree-last-address.png?branch=master)](http://travis-ci.org/futhr/spree-last-address)
[![Dependency Status](https://gemnasium.com/futhr/spree-last-address.png)](https://gemnasium.com/futhr/spree-last-address)
[![Coverage Status](https://coveralls.io/repos/futhr/spree-last-address/badge.png?branch=master)](https://coveralls.io/r/futhr/spree-last-address)

During checkout, causes the address to be prefilled with the address from their most recent order or the user’s saved address (if available).

This relieves the customer of having to type in his address again on a second order. (The unnecessary typing make them more likely to bounce instead of completing the order.)

If your app allows a user to set and edit their "preferred" or "default" address (as reflected by `user.bill_address`/`user.ship_address`), and the user has set a preferred address for their account, that address will take priority and be used instead of the address from their most recent order. (Similar to [spree-default-addresses][4].)

As of Spree 1.2, the `belongs_to :bill_address` and `belongs_to :ship_address` associations are provided for the `Spree::User` model by the spree_auth_devise gem. If those associations are not available or if the user doesn't have a saved address (which will be the case unless you've provided a way in your app to set an address), then it will just use the address from user's most recent order.

## Installing

Add to your `Gemfile`:
```ruby
gem 'spree_last_address', github: 'futhr/spree-last-address'
```

Run

    bundle install

## TODO

* write tests :/

## Kudos

* kenscotthlebek
* TylerRick - heavy refactor for spree 1.2

## Contributing

In the spirit of [free software][1], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][2]
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][2]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle install`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2013 Torsten Rüger, released under the [New BSD License][3]

[1]: http://www.fsf.org/licensing/essays/free-sw.html
[2]: https://github.com/futhr/spree-last-address/issues
[3]: https://github.com/futhr/spree-last-address/tree/master/LICENSE.md
[4]: https://github.com/swistak/spree-default-addresses

