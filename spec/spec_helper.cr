ENV["APP_ENV"] = "test"
ENV["APP_PORT"] = "3001"

require "spec-kemal"
require "hashr"
require "../src/production_line_report"
require "../spec/support/**"

Avram::Migrator::Runner.new.ensure_migrated!

Spec.before_each do
  AppDatabase.truncate
end

def query(query_path = "")
  if query_path != ""
    graphql_queries_path = "./spec/graphql_queries/#{query_path}.graphql"
  else
    graphql_queries_path = caller[2][/(.+?):\d+.*/, 1].gsub("graphql", "graphql_queries").gsub("_spec.cr", ".graphql")
  end

  if File.exists? graphql_queries_path
    File.read(graphql_queries_path)
  else
    raise "`File #{graphql_queries_path}' not exists!"
  end
end

def post_json(path, *, headers : HTTP::Headers? = nil, body = nil)
  auth = Base64.encode("#{BASIC_AUTH_USERNAME}:#{BASIC_AUTH_PASSWORD}").chomp
  headers = HTTP::Headers.new if headers.nil?
  body = body.to_json if !body.nil?

  headers.merge!(
    {
      "Authorization" => "Basic #{auth}",
      "Accept"        => "application/json",
      "Content-Type"  => "application/json",
    }
  )

  post(path, headers, body)

  res = Hash(String, JSON::Any).from_json(response.body)

  res.dig?("errors") && res.dig("errors").should be_nil
end

def json_response
  Hashr.new(Hash(String, JSON::Any).from_json(response.body))
end
