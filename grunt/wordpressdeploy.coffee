module.exports =
  options:
    # backups_dir: "backups"
    rsync_args: [
      "--verbose"
      "--progress"
      "-rlpt"
      "--compress"
      "--omit-dir-times"
      # "--delete"
      # "--dry-run"
    ]
    exclusions: [
      "Gruntfile.*"
      ".git/"
      "tmp/*"
      "backups/"
      "wp-config.php"
      "composer.json"
      "composer.lock"
      "README.md"
      ".gitignore"
      "package.json"
      "node_modules"
      ".DS_Store"
      "sftp-config.json"
      "codekit-config.json"
      "config.codekit"
      # Commented out for pushing plugins/themes that compile LESS at runtime
      # "*.less"
      "backwpup-*"
      "grunt"
      "vendor"
      "*.coffee"
      "deployconfig.*"
      ".codekit-cache/" # Proprietary file from Codekit     
      # Grunt Build
      "releases/"
      "build/"
      # For Use with Roots Theme Setup
      "assets/less/"
      "assets/js/plugins"
      ".editorconfig" 
      ".bowerrc" 
      "bower.json"       
      # Theme-specific Exclusions
      "_Project Images/"
    ]

  local:
    title: "Local"
    database: "wordpress"
    table_prefix: "wp_"
    table_exclusions : [
    ]
    user: "admin"
    pass: "admin"
    host: "localhost"
    url: "//localhost:8888/best-client-ev.er"
    path:
      theme   : "<%= deployconfig.local.wp_content_path %>/themes/<%= theme_name %>/build/"
      uploads : "<%= deployconfig.local.wp_content_path %>/uploads/"
      plugins : "<%= deployconfig.local.wp_content_path %>/plugins/"


  # ==========  Start Environment Definitions  ==========


  dev:
    title: "Dev Site"
    database: "client_dev"
    table_prefix: "wp_"
    table_exclusions : [
      "_wf" # Will exclude with " NOT LIKE '%_wf%' " SQL statement
    ]        
    user: "<%= deployconfig.dev.db_user %>"
    pass: "<%= deployconfig.dev.db_pass %>"
    host: "127.0.0.1"
    url: "//dev.best-client-ev.er"
    path:
      theme   : "<%= deployconfig.dev.wp_content_path %>/themes/<%= theme_name %>/"
      uploads : "<%= deployconfig.dev.wp_content_path %>/uploads/"
      plugins : "<%= deployconfig.dev.wp_content_path %>/plugins/"
    ssh_host: "dev_user@ssh.best-client-ev.er"

  prod:
    title: "Production Site"
    database: "client_wp"
    table_prefix: "wp_"
    table_exclusions : []        
    user: "<%= deployconfig.prod.db_user %>"
    pass: "<%= deployconfig.prod.db_pass %>"
    host: "127.0.0.1"
    url: "//best-client-ev.er"
    sql_remove: [
      "Warning: Using a password on the command line interface can be insecure."
    ]    
    path:
      theme   : "<%= deployconfig.prod.wp_content_path %>/themes/<%= theme_name %>/"
      uploads : "<%= deployconfig.prod.wp_content_path %>/uploads/"
      plugins : "<%= deployconfig.prod.wp_content_path %>/plugins/"
    ssh_host: "main_user@ssh.best-client-ev.er"
