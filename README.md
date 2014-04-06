# Spree Last Address

[![Gem Version](https://badge.fury.io/rb/spree-last-address.png)](http://badge.fury.io/rb/spree-last-address)

During checkout, causes the address to be prefilled with the address from their most recent order or the user’s saved address (if available).

This relieves the customer of having to type in his address again on a second order. (The unnecessary typing make them more likely to bounce instead of completing the order.)

If your app allows a user to set and edit their "preferred" or "default" address (as reflected by `user.bill_address`/`user.ship_address`), and the user has set a preferred address for their account, that address will take priority and be used instead of the address from their most recent order. (Similar to [spree-default-addresses][1].)

As of Spree 1.2, the `belongs_to :bill_address` and `belongs_to :ship_address` associations are provided for the `Spree::User` model by the [spree_auth_devise][2] gem. If those associations are not available or if the user doesn't have a saved address (which will be the case unless you've provided a way in your app to set an address), then it will just use the address from user's most recent order.

---

## Installing

Add to your `Gemfile`
```ruby
gem 'spree_last_address', '~> 1.0.1'
```

Run

    bundle install

---

## Contributing

See corresponding [contribution guidelines][3].

---

## License

Copyright (c) 2010-2014 [Tobias Bohwalli][4], [Torsten Rüger][5], and other [contributors][6], released under the [New BSD License][7]

[1]: https://github.com/swistak/spree-default-addresses
[2]: https://github.com/spree/spree_auth_devise
[3]: https://github.com/futhr/spree-last-address/blob/master/CONTRIBUTING.md
[4]: https://github.com/futhr
[5]: https://github.com/dancinglightning
[6]: https://github.com/futhr/spree-last-address/graphs/contributors
[7]: https://github.com/futhr/spree-last-address/blob/master/LICENSE.md
