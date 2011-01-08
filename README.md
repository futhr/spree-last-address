SpreeLastAddress
================

Relieves the customer of typing his address again on a second order. (As this unnecessary typing may lead to order abortion)

Prefills any address during checkout with the last used address.

Also fills in address in admin if the email address is given.

And (as added extra) creates dummy addresses in admin interface if no email or address info is set. But only if you set dummy_addresses config option.

No db changes, one query during checkout more.

PS: The bizzare ActiveRecord::AssociationTypeMismatch error has hit me and so this currently only works with config.cache_classes = true  , set also in development. (There seems to be a hidden class loading issue somewhere)



Copyright (c) 2010 [Torsten Rüger], released under the New BSD License
