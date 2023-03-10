require "pg"
require "avram"
require "../models/base_model"
require "../models/**"
require "../queries/**"
require "../operations/**"
require "../../db/migrations/**"

APP_PORT = (ENV["APP_PORT"]? || "3000").to_i
APP_NAME = ENV["APP_NAME"]? || "production_line_report"
APP_ENV  = ENV["APP_ENV"]? || "development"
postgres_host = ENV["POSTGRES_HOST"]? || "localhost"
postgres_port : Int32? = ENV["POSTGRES_PORT"]?.try(&.to_i) || 5432
postgres_user = ENV["POSTGRES_USER"]? || "postgres"
postgres_password = ENV["POSTGRES_PASSWORD"]? || "postgres"

class AppDatabase < Avram::Database
end

AppDatabase.configure do |settings|
  settings.credentials =
    Avram::Credentials.parse?(ENV["DATABASE_URL"]?) ||
      Avram::Credentials.new(
        database: "#{APP_NAME}_#{APP_ENV}",
        hostname: postgres_host,
        port: postgres_port,
        username: postgres_user,
        password: postgres_password
      )
  p! settings.credentials.database
  p! settings.credentials.url
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  case APP_ENV
  when "production"
    settings.lazy_load_enabled = true
  when "development"
    DB::Log.level = :debug
    Avram::QueryLog.dexter.configure(:debug)
  end
end

if ENV["LUCKY_TASK"]? != "true"
  Avram::Migrator::Runner.new.run_pending_migrations
end
