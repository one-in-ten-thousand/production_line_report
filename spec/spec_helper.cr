ENV["APP_ENV"] = "test"
require "spec-kemal"
require "../src/production_line_report"
require "../spec/support/**"

Avram::Migrator::Runner.new.ensure_migrated!

Spec.before_each do
  AppDatabase.truncate
end

def post_json(path, *, headers : HTTP::Headers? = nil, body = nil)
  auth = Base64.encode("#{BASIC_AUTH_USERNAME}:#{BASIC_AUTH_PASSWORD}").chomp
  headers = HTTP::Headers.new if headers.nil?
  body = body.to_json if ! body.nil?

  headers.merge!(
    {
      "Authorization" => "Basic #{auth}",
      "Accept" => "application/json",
      "Content-Type" => "application/json",
    }
  )

  post(path, headers, body)
end
