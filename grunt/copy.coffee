module.exports = 
  build:
    src: [
      # Capture all
      "**"
      # Exceptions below....
      "!.DS_Store"
      "!wp-config.php"
      "!README.md"
      "!tmp/**"
      "!backwpup-*"
      # Bower
      "!bower_components/**"
      # git
      "!.git/**"
      "!.gitignore"
      # Composer
      "!vendor/**"
      "!composer.json"
      "!composer.lock"
      # npm / grunt
      "!Gruntfile.*"
      "!package.json"
      "!node_modules/**"
      "!npm-debug.log"
      # Load grunt config
      "!grunt/**"
      # Grunt wordpress deploy
      "!deployconfig.*"
      "!backups/**"
      # Grunt build output
      "!build/**"
      "!releases/**"
      # Codekit
      "!config.codekit"
      "!.codekit-cache/"
      # My personal workflow
      "!_Production/**"
      "!src/**"
      "!*.less"
      "!*.coffee"
      "!*.zip"
      "!*.map"
      # Add excludes for this project..
      "!_Project Images/**"
    ]
    dest: "build/"