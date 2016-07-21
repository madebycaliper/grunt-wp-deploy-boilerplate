deployconfig = require('./deployconfig.json')

module.exports = (grunt) ->

  require('load-grunt-config')(grunt,
    config:
      deployconfig : deployconfig
      pkg: grunt.file.readJSON('package.json')
      theme_name: 'client_name-theme'      
  )

  # Register tasks
  grunt.registerTask "default" , ["watch"]
  grunt.registerTask "build"   , ["clean:build", "copy:build", "compress:build"]
  grunt.registerTask "deploy"  , ["build", "push_theme"]
  grunt.registerTask "sync_up" , ["push_plugins", "push_uploads", "deploy", "push_db"]
  return

