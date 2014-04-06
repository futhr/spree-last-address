# Spree Last Address

[![Build Status](https://api.travis-ci.org/futhr/spree-last-address.png?branch=2-2-stable)](http://travis-ci.org/futhr/spree-last-address)
[![Code Climate](https://codeclimate.com/github/futhr/spree-last-address.png)](https://codeclimate.com/github/futhr/spree-last-address)
[![Coverage Status](https://coveralls.io/repos/futhr/spree-last-address/badge.png?branch=2-2-stable)](https://coveralls.io/r/futhr/spree-last-address)

During checkout, causes the address to be prefilled with the address from their most recent order or the user’s saved address (if available).

This relieves the customer of having to type in his address again on a second order. (The unnecessary typing make them more likely to bounce instead of completing the order.)

If your app allows a user to set and edit their "preferred" or "default" address (as reflected by `user.bill_address`/`user.ship_address`), and the user has set a preferred address for their account, that address will take priority and be used instead of the address from their most recent order. (Similar to [spree-default-addresses][1].)

As of Spree 1.2, the `belongs_to :bill_address` and `belongs_to :ship_address` associations are provided for the `Spree::User` model by the [spree_auth_devise][2] gem. If those associations are not available or if the user doesn't have a saved address (which will be the case unless you've provided a way in your app to set an address), then it will just use the address from user's most recent order.

---

## Installing

Add to your `Gemfile`
```ruby
gem 'spree_last_address', '~> 2.2.0'
```

Run

    bundle install

---

## Contributing

See corresponding [contribution guidelines][3].

---

## License

Copyright (c) 2011-2014 [Tobias Bohwalli][4], [Torsten Rüger][5], and other [contributors][6], released under the [New BSD License][7]

[1]: https://github.com/swistak/spree-default-addresses
[2]: https://github.com/spree/spree_auth_devise
[3]: https://github.com/futhr/spree-last-address/blob/master/CONTRIBUTING.md
[4]: https://github.com/futhr
[5]: https://github.com/futhr/spree-last-address/blob/master/LICENSE.md
[6]: https://github.com/dancinglightning
[7]: https://github.com/futhr/spree-last-address/graphs/contributors
