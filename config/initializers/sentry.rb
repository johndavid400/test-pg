
Raven.configure do |config|
  config.dsn = 'https://ffded842f0614af8a9bbd82c625b2981@o177259.ingest.sentry.io/5518794'
  config.environments = ['development', 'staging', 'production']
  config.before_send = lambda { |event, hint|
    status = event.context.rack_env["action_controller.instance"].instance_variable_get(:@_response).status rescue nil
  }
end

