require "kemal"
require "kemal-basic-auth"

BASIC_AUTH_USERNAME = ENV["BASIC_AUTH_USERNAME"]? || "admin"
BASIC_AUTH_PASSWORD = ENV["BASIC_AUTH_PASSWORD"]? || "123456"

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
