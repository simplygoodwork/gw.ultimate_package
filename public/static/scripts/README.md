Writing JavaScript
==========================================

When writing standard JavaScript it's important to adhere to [Douglas
Crockford's code conventions](http://javascript.crockford.com/code.html).

It's preferred that you write in CoffeeScript, but not required. All
CoffeeScript is compiled from `/public/static/scripts/myscript.coffee` to
`/public/static/scripts/build/myscript.js` all scripts (except Modernizr) are
then concatinated into `public/static/scripts/dist/package_name.js` or
`package_name.min.js` if you're running for production.

Testing
------------------------------------------

[Qunit](http://qunitjs.com/) is bundled for testing, and it's recommended that
all scripts have tests attached. There is a bare bones example included for
access links, but it's recommended you use a jQuery plugin for similar
functionality. Here's a [boilerplate](http://jqueryboilerplate.com/) to get
you started.

Settings object
------------------------------------------

There is a global settings object that you can pass information from the server
to. It's used for things like urls to static, or usernames etc. for async
work. Since it's global, you can amend it anywhere, but it's instantiated in
the `base.html` template thus:

    var settings = settings || {};

You could then add a username to that with

    settings.username = 'ceejeemccoolguy';

And hey presto, global username available to all scripts (unless you override
the settings variable of course).