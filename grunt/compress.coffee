module.exports =
  build:
    options:
      archive: 'releases/<%= pkg.name %>-<%= pkg.version %>.zip'
    cwd: 'build/',
    src: ['**/*'],
    dest: '<%= pkg.name %>/'