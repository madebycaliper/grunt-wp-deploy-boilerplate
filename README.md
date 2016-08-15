Grunt WP Deployment Boilerplate
===========================

## Overview

These are the base files and install script necessary to start using [grunt-wordpress-deploy](https://github.com/madebycaliper/grunt-wordpress-deploy) for your WordPress theme development workflow.

Please submit an issue if you run into installation problems.

:loudspeaker: &nbsp; _**Note:** The setup examples below assumes you're developing just a theme. There are some slight modifications you have to make if you want to use this for a theme + plugin deploy flow at the same time._

:bulb: &nbsp; _@TODO: Add examples and instructions on developing a plugin and theme simultaneously._


## Global Requirements

You must have [Node.js](http://nodejs.org/) and [npm](https://www.npmjs.org/) installed. [Get em](https://docs.npmjs.com/getting-started/installing-node).

This project also uses [Grunt](http://gruntjs.com/getting-started) – which will be installed in the target folder using when `npm install` is run – but you'll need to install the Grunt command line interface (grunt-cli) 'globally' so you can use the `grunt` command on the command line. If none of that made sense, it's OK. Just follow the [Grunt Getting Started instructions](http://gruntjs.com/getting-started) and they'll walk you through it.


## Project Dependencies

If you're familiar with traditional [`Gruntfile.js`](http://gruntjs.com/sample-gruntfile) structures you might notice an odd-looking Gruntfile here – there are two reasons:

1. This project utilizes the [load-grunt-config](http://firstandthird.github.io/load-grunt-config/) package to allow modularization of Grunt tasks. Each file in the `./grunt` directory represents an _auto-loaded_ Grunt task (named like `{TASK_NAME}.coffee`). The meat-and-potatoes in `Gruntile.coffee` is the line that initializes this package:

        require('load-grunt-config')(grunt, config)

  For the purposes of this project, you don't really need to understand ths ins and outs of the Gruntfile. We'll almost exclusively be looking at and modifying `wordpressdeploy.coffee`.

2. You're looking at [Coffeescript](http://coffeescript.org), not Javascript. I generally don't write in coffee when developing WP themes, but I always use it for creating Grunt and task files, since it makes for a much leaner and more readable file.


## Let's do this

##### 1. Use your command line tool of choice (I prefer [iTerm2](http://iterm2.com/) with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed) and navigate to your theme folder:

  ```shell
  cd /Applications/MAMP/htdocs/best-client-ev.er/wp-content/themes/client_name-theme/
  ```

##### 2. Clone this repo into your theme or plugin folder:

  ```shell
  git clone https://github.com/madebycaliper/grunt-wp-deploy-boilerplate.git
  ```

##### 3. If you trust me, run the installer script (or you can manually copy the files to the parent folder, including `.gitignore`):

  ```shell
  sh ./grunt-wp-deploy-boilerplate/install.sh
  ```

##### 4. Install the node packages using `npm` ([Node Package Manager](https://www.npmjs.com/)) :

  ```shell
  npm install
  ```

### Configuration

This is a simple two step process:

1. Configure "environments" that represent the different WordPress installs you're dealing with (`wordpressdeploy.coffee`).

2. Provide connection details (filepath, database user and password) for each of those environments, stored in a file that you're not tracking in your git repository (`deployconfig.json`).

### Setting up your Environments

Please follow the instructions in the [grunt-wordpress-deploy docs](https://github.com/madebycaliper/grunt-wordpress-deploy#getting-started) to configure your environments.

### Providing Connection Details

Just like the WordPress installation flow, there's a sample config file included in the repo with the suffix `-sample`. Remove the `-sample` from the name and add your sensitive information to get started.

:dart: &nbsp; **Try it out:** _If you're just learning your way around the command line, here's a simple way to do that using the "move" command:_

```
mv deployconfig-sample.json deployconfig.json
```

By default, `deployconfig.json` is excluded in the `.gitignore` file, so you should be covered. 


```json
{
  "local": {
    "db_user":"admin",
    "db_pass":"admin",  
    "wp_content_path":"/Applications/MAMP/htdocs/best-client-ev.er/wp-content"
  },
  "dev": {
    "db_user":"client_dev",
    "db_pass":"pass_goes_here",
    "wp_content_path":"/home/client/public_html/dev/wp-content"
  },
  "prod": {
    "db_user":"client_production",
    "db_pass":"pass_goes_here",
    "wp_content_path":"/home/client/public_html/wp-content"
  }
}

```

:interrobang: &nbsp; _**Troubleshooting:** If you're tracking this project with git (you should be) and thish config file shows up in your repo, it means you have the filename wrong. This will not only expose your secret info to anyone looking at your repo, but it will cause the tasks to fail when you try to run them._


### Properties

Each environment definition requires the `wp_content_path` key, and each remote definition requires both the `db_user` and `db_pass` keys.

:loudspeaker: &nbsp; _**Note** : The local object must be named "local". Don't change it._

* `wp_content_path` : Establish where your `wp-content` folder lives locally and remotely. This key will be accessed every time you push or pull files using the `grunt-wordpress-deploy` package.

* `db_user` : The SQL database user for WP. This is the same user that will most likely be defined in your `wp-config.php` file.

* `db_pass` : The password for the above SQL database user. This password will also probably be defined in your `wp-config.php` file, unless you have a non-traditional `wp-config` setup.


### Setting up your Gruntfile

The only thing you really need to change in the `Gruntfile.coffee` file included here is the `theme_name` property. Change this to match the folder in which you're developing your theme.

:loudspeaker: &nbsp; _**Note :** It must be the same on the local and all the remote servers_

```coffee
  require('load-grunt-config')(grunt,
    config:
      deployconfig : deployconfig
      pkg: grunt.file.readJSON('package.json')
      theme_name: 'client_name-theme'      
  )
```


## Available Tasks


#### `grunt build`

This is a task that's really handy for real-world WordPress theme dev/deployment. Sometimes your client may not have a server with SSH (or even FTP, in worst case scenarios) and you just have to work around it to get your job done. Or maybe you know it as ":moneybag::moneybag::moneybag:".

`build` creates a `.zip` file you can either upload directly through the WP backend or send to a client so they can do it themselves, while also creating a guesswork-free FTP upload flow – simply overwrite your remote theme folder with all the contents of the `/build` folder and you're good to go.

Under the hood, the `build` task will:

1. Create a `/build` directory at your theme folder's root.

2. Copy all the files in the theme folder's root, except those specified in the `grunt/copy.coffee` file. This allows you to exclude source files and sensitive files when you push to your remote servers.

3. Create a `/releases` folder and generate a `.zip` of the `/build` folder within it. The `.zip` will be named using the theme name and version in the `package.json` file. You can inspect these properites in the `grunt/compress.coffee` file. (e.g.: `releases/client-theme-1.0.2.zip`).


#### `grunt deploy --target={env}`

This will run your `build` task and then push the theme to the specified path on the remote server.

#### `grunt sync_up --target={env}`

:pizza: &nbsp; _Use Caution when using this task. It does a lot and is NOT reversible._

This is a helper that's meant to create parity between local and remote servers – making sure all required plugins and uploaded assets are available when the site runs.

`sync_up` will:

1. Overwrite the entire remote `/plugins` directory with the local stuff.

2. Overwrite the entire `/uploads` directory with the local stuff.

3. Run the `deploy` task (build and push your theme).

4. Overwrite the remote DB with your local DB.

:bulb: &nbsp; _@TODO: write `sync_down` helper to work the opposite direction._



## Get on with your damn life.

That's it! You should be setup to push/pull between your local install and different environs like so:

```
grunt push_theme --target=dev
```

Enjoy responsibly.

And submit an issue to this repo if you're having trouble.


#### Please refer to the [grunt-wordpress-deploy docs](https://github.com/madebycaliper/grunt-wordpress-deploy/) for deployment syntax/instructions.

