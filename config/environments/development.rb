Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
   config.file_watcher = ActiveSupport::EventedFileUpdateChecker
   config.action_cable.url= "ws://localhost:3000/cable"

  config.action_mailer.default_url_options = { host: '0.0.0.0', port: 8080 }

  config.action_mailer.delivery_method= :smtp
  #config.action_mailer.smtp_settings={
  #  address: 'smtp.mailgun.com',
  #  port: 587,
  #  enable_starttls_auto: true,
  #  authentication: "plain",
  #  user_name: 'denswaminvest@gmail.com',
  #  password: 'D&D4life!'
#  }

  config.action_mailer.smtp_settings={
    address: 'smtp.mailgun.org',
    port: 587,
    domain: 'sandbox31000466ed7f458196c584be115e49ea.mailgun.org',
    authentication: "plain",
    user_name: 'postmaster@sandbox31000466ed7f458196c584be115e49ea.mailgun.org',
    password: '5a012f255784b425d4d8057179a19dd0-52b0ea77-c3c12734'
  }

  config.paperclip_defaults={
    storage: :s3,
    path: ':class/:attachment/:id/:style/:filename',
    s3_host_name: "s3.amazonaws.com",
    s3_credentials:{
      bucket: 'ghala-share',
      access_key_id: 'AKIASF5ZZIULBRQ7UMX3',
      secret_access_key: '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',
      s3_region: 'us-east-1'

    }
  }

end
