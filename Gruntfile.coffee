deployconfig = require('./deployconfig.json')

module.exports = (grunt) ->

  require('load-grunt-config')(grunt,
    config:
      deployconfig : deployconfig
  )

  # Register tasks
  grunt.registerTask "default", ["watch"]
  grunt.registerTask "deploy", ["wordpressdeploy"]

  return

