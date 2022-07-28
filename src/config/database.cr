require "pg"
require "avram"
require "../models/base_model"
require "../models/**"
require "../queries/**"
require "../operations/**"

app_port = ENV["APP_PORT"]? || "8080"
app_name = ENV["APP_NAME"]? || "magpie_code_admin"
app_env = ENV["APP_ENV"]? || "development"
postgres_host = ENV["POSTGRES_HOST"]? || "localhost"
postgres_port : Int32? = ENV["POSTGRES_PORT"]?.try(&.to_i) || 65432
postgres_user = ENV["POSTGRES_USER"]? || "postgres"
postgres_password = ENV["POSTGRES_PASSWORD"]? || "toor654123"

p! app_port
p! app_name
p! app_env
p! postgres_host
p! postgres_port
p! postgres_user
p! postgres_password

class AppDatabase < Avram::Database
end

AppDatabase.configure do |settings|
  settings.credentials =
    Avram::Credentials.parse?(ENV["DATABASE_URL"]?) ||
    Avram::Credentials.new(
      database: "#{app_name}_#{app_env}",
      hostname: postgres_host,
      port: postgres_port,
      username: postgres_user,
      password: postgres_password
    )
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  settings.lazy_load_enabled = app_env != "production"
end
