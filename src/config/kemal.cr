require "kemal"
require "kemal-basic-auth"

basic_auth "admin", "123456"

class CustomAuthHandler < Kemal::BasicAuth::Handler
  only ["/admin"]

  def call(context)
    return call_next(context) unless only_match?(context)
    super
  end
end

Kemal.config do |config|
  config.public_folder = "src/assets"
  config.auth_handler = CustomAuthHandler
end