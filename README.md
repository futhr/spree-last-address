Last Address extension for Spree
================================

During checkout, causes the address to be prefilled with the address from their most recent order or
the user’s saved address (if available).

This relieves the customer of having to type in his address again on a second order. (The
unnecessary typing make them more likely to bounce instead of completing the order.)

If your app allows a user to set and edit their "preferred" or "default" address (as reflected by
`user.bill_address`/`user.ship_address`), and the user has set a preferred address for their
account, that address will take priority and be used instead of the address from their most recent
order. (Similar to [spree-default-addresses](https://github.com/swistak/spree-default-addresses).)

As of Spree 1.2, the `belongs_to :bill_address` and `belongs_to :ship_address` associations are
provided for the `Spree::User` model by the spree_auth_devise gem .  If those associations are not
available or if the user doesn't have a saved address (which will be the case unless you've provided
a way in your app to set an address), then it will just use the address from user's most recent
order.

Installation
=============

Just put this in your Gemfile:

gem 'spree_last_address', :git => "git://github.com/TylerRick/spree_last_address.git"

Contributors
============

* kenscotthlebek
* TylerRick

Copyright (c) 2010 [Torsten Rüger], released under the New BSD License
