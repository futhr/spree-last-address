SpreeLastAddress
================

Relieves the customer of typing his address again on a second order. (As this unnecessary typing may lead to order abortion)

Prefills any address during checkout with the last used address.

Also fills in address in admin if the email address is given.

No db changes, one query during checkout more.

Installation
=============
Just put in your Gemfile 

gem 'spree_last_address', :git => "git://github.com/dancinglightning/spree-last-address.git"

No assets, no migrations, not rake tasks.

Extras
=====

As extra admin functionality there are two small changes which make the life of admin easier. You will need to set the config option :dummy_addresses to activate them:

- creates dummy addresses in admin interface if no email or address info is set. 

- if the email is changed from an "anonymous" one to a real one, the change is also made to the User object that made the order.

PS: I pulled best commits from forked reps. Thanks to kenscotthlebek,  TylerRick


Copyright (c) 2010 [Torsten Rüger], released under the New BSD License
