SpreeLastAddress
================

Relieves the customer of typing his address again on a second order. (As this unnecessary typing may lead to order abortion)

Prefills any address during checkout with the last used address.

Also fills in address in admin if the email address is given.

No db changes, one query during checkout more.

Extras
=====

As extra admin functionality there are two small changes wich make the life of admin easier. You will need to set the config option :dummy_addresses to activate them:

- creates dummy addresses in admin interface if no email or address info is set. 

- if the email is changed from an "anonymous" one to a real one, the change is also made to the User object that made the order.

PS: The bizzare ActiveRecord::AssociationTypeMismatch error has hit me and so this currently only works with config.cache_classes = true  , set also in development. (There seems to be a hidden class loading issue somewhere)



Copyright (c) 2010 [Torsten Rüger], released under the New BSD License
