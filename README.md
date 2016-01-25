Grunt WP Deployment Boilerplate
===========================

These are the base files necessary to start using grunt-wordpress-deploy for a WordPress theme/installation


Requirements
===========================

You must have [Node.js](http://nodejs.org/) and [npm](https://www.npmjs.org/) installed. Get em.

This project also uses [Grunt](http://gruntjs.com/getting-started) – which will be installed in the target folder using when `npm install` is run – but you'll need to install the Grunt command line interface (grunt-cli) 'globally' so you can use the `grunt` alias on the command line. (If this doesn't make any sense, it's OK. Just follow the Grunt Getting Started instructions linked above and they'll walk you through it).


Dependencies
===========================

If you're familiar with traditional `Gruntfile.js` structures you might notice an odd-looking Gruntfile here – there are two reasons:

1. This project utilizes the [load-grunt-config](http://firstandthird.github.io/load-grunt-config/) package to allow modularization of Grunt tasks. Each file in the `./grunt` directory represents an _auto-loaded_ Grunt task (named like `{TASK_NAME}.coffee`). The meat-and-potatoes in `Gruntile.coffee` is the line that initializes this package:

        require('load-grunt-config')(grunt, config)

  For the purposes of this project, you don't really need to understand ths ins and outs of the Gruntfile. We'll almost exclusively be looking at and modifying `wordpressdeploy.coffee`.

2. You're looking at [Coffeescript](http://coffeescript.org), not Javascript. I generally don't write in coffee when developing WP themes, but I always use it for creating Grunt and task files, since it makes for a much leaner and more readable file.


Let's do this
===========================

Clone this repo somewhere (anwywhere, really) on your machine:

```
git clone https://github.com/jambox/grunt-wp-deploy-boilerplate.git
```

Copy the files into your WP theme folder.

Use your command line tool of choice (I prefer [iTerm2](http://iterm2.com/) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed) and navigate to your theme folder.
```
cd /Applications/MAMP/htdocs/client-site.com/wp-content/themes/client_name-theme/
```
Install the node packages using `npm`
```
npm install
```


Get on with your damn life.
===========================

That's it! You should be setup to push/pull between your local install and different environs like so:

```
grunt push_theme --target=dev
```

Enjoy responsibly.

And submit an issue to this repo if you're having trouble.


###Please refer to the [grunt-wordpress-deploy docs](https://github.com/jambox/grunt-wordpress-deploy/) for deployment syntax/instructions.

