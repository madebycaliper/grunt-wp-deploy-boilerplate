deployconfig = require('./deployconfig.json')

module.exports = (grunt) ->

  require('load-grunt-config')(grunt,
    config:
      deployconfig : deployconfig
      pkg: grunt.file.readJSON('package.json')
  )

  # Register tasks
  grunt.registerTask "default", ["watch"]
  grunt.registerTask "deploy", ["wordpressdeploy"]

  return

