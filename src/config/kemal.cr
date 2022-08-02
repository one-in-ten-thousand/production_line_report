require "kemal"
require "kemal-basic-auth"

class CustomAuthHandler < Kemal::BasicAuth::Handler
  exclude ["/"]

  def call(context)
    return call_next(context) if exclude_match?(context)
    super
  end
end

Kemal.config do |config|
  config.auth_handler = CustomAuthHandler
  config.env = APP_ENV
end
