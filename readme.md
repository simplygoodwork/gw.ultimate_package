![The Ultimate Package](https://github.com/erskinedesign/ed.ultimate_package/raw/master/public/static/images/branding/branding.png "The Ultimate Package")
# The Ultimate Package
[![Build Status](https://secure.travis-ci.org/erskinedesign/ed.ultimate_package.png?branch=master)](http://travis-ci.org/erskinedesign/ed.ultimate_package)

The Ultimate Package is [Erskine Design][]'s framework for rapidly developing 
the front-end of our projects and is under constant development and improvement 
by the team at Erskine Design, who use it daily.

Please refer to the wiki for [Erskine's front-end coding standards][wiki]

## Getting started
The package is a barebones framework to help you rapidly develop your projects. 
Create templates using the [Twig template engine][] in `/templates` as you need
them and use `/templates/elements.html` to check your styles.

The app will render your template directly from the url, so if you go to
`/my/page.html` it will render the template in `/templates/my/page.html`.

You can use `screen-prototype.scss` for prototyping and `screen.scss` for production work.

## Requirements and setup
* [Node][]
* [NPM][]
* [grunt][]
* [Composer][]

### Installing the Ultimate Package
1. Clone the repository, `git clone git://github.com/erskinedesign/ed.ultimate_package.git` or probably better still - [download it][download] so you
don't have all of our Git history.
1. Install [Composer][] `curl -s http://getcomposer.org/installer | php`
1. Install the PHP requirements `php composer.phar install`
1. Install [Node][] and NPM
1. Install grunt cli `npm install -g grunt-cli`
1. Install grunt packages `npm install` the packages are defined in `packages.json` if you're nosy
1. Compile the CoffeeScript and Sass and run the JS unit tests `grunt`
1. Point your web server to the `/public` folder

## Watching for changes and compiling CoffeeScript / Sass
Grunt watch is a required package which allows you to watch for changes to your Sass and CoffeeScript

    grunt watch

## Not designed for production!
This codebase is designed solely for development usage, we __strongly__
advise you do not use it in production. The routing is as basic as
possible, and thus has little protection built in.

## Credits
The project is currently maintained by [the team at Erskine Design][]. The original Ultimate Package was created by [Greg Wood][].

## License
The Ultimate Package is Copyright &copy; 2012 [Erskine Design][] and is licensed under the [Creative Commons 3.0][] license.

<a style="float:right;" href="http://gridpak.com/"><img src="https://github.com/erskinedesign/ed.ultimate_package/raw/master/public/static/images/branding/badge-gridpak.png"/></a>

[Erskine Design]: http://erskinedesign.com/
[Twig template engine]: http://twig.sensiolabs.org/
[Composer]: http://getcomposer.org/
[Node]: https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
[NPM]: https://npmjs.org/
[grunt]: https://github.com/gruntjs/grunt/wiki/Installing-grunt

[the team at Erskine Design]: https://twitter.com/erskinedesign/team/members
[Greg Wood]: http://gregorywood.co.uk/

[Creative Commons 3.0]: http://creativecommons.org/licenses/by-nc-sa/3.0/

[wiki]: https://github.com/erskinedesign/ed.ultimate_package/wiki
[download]: https://github.com/erskinedesign/ed.ultimate_package/zipball/master
