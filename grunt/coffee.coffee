module.exports =
  glob_to_multiple:
    expand: true
    flatten: true
    options:
      bare: false
    cwd: 'src/'
    src: ['*.coffee']
    dest: 'src/'
    ext: '.js'