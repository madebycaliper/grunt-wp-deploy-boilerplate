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
      "*.less"  # Comment this line if you compile LESS at runtime (but why?)
      "backwpup-*"
      "grunt"
      "vendor"
      "*.coffee"
      "deployconfig.*"
      "src/"
      # Grunt Build
      "releases/"
      "build/"
      # Theme-specific Exclusions
      "client-design-files/" # An example of a folder you wouldn't want to sync
    ]

  local:
    title: "Local"
    database: "wordpress"
    table_prefix: "client_wordpress_"
    table_exclusions : [
      # "wfBadLeechers",
      # "wfBlocks",
      # "wfBlocksAdv",
      # "wfFileMods",
      # "wfHits"
    ]
    user: "admin"
    pass: "admin"
    host: "localhost"
    url: "//localhost:8888/client-site.com"
    path:
      theme: "/Applications/MAMP/htdocs/client-site.com/wp-content/themes/client_name-theme/"
      uploads: "/Applications/MAMP/htdocs/client-site.com/wp-content/uploads/"


  # ==========  Start Environment Definitions  ==========

  client_host:
    title: "client_host"
    database: "client_db"
    table_prefix: "client_name_db_"
    table_exclusions : [
      "_wf" # Will exclude with " NOT LIKE '%_wf%' " SQL statement
    ]        
    user: "<%= grunt.config.data.deployconfig.client_host.db_user %>"
    pass: "<%= grunt.config.data.deployconfig.client_host.db_pass %>"
    host: "mysql.client-site.com"
    url: "//client-site.com"
    sql_remove: [ # Get rid of unwanted STDOUT statements from remote sql servers
      # "Warning: Using a password on the command line interface can be insecure."
    ]    
    path:
      theme: "/home/client_name/client-site.com/wp-content/themes/client_name-theme/"
      uploads: "/home/client_name/client-site.com/wp-content/uploads/"
    ssh_host: "client_name@my.client_host.com"

  dev:
    title: "Dev Server"
    database: "wordpress"
    table_prefix: "client_name_wp_"
    table_exclusions : [
      "_wf" # Will exclude with " NOT LIKE '%_wf%' " statement
    ]        
    user: "<%= grunt.config.data.deployconfig.dev.db_user %>"
    pass: "<%= grunt.config.data.deployconfig.dev.db_pass %>"
    host: "127.0.0.1"
    url: "//my-portfolio-site.com/client/client_name"
    path:
      theme: "/home/wordpress/public_html/client/client_name/wp-content/themes/client_name-theme/"
      uploads: "/home/wordpress/public_html/client/client_name/wp-content/uploads/"
    ssh_host: "wordpress@ssh.my-portfolio-site.com"
