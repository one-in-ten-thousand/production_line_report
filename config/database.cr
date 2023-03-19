require "pg"
require "avram"
require "../src/models/base_model"
require "../src/models/**"
require "../src/queries/**"
require "../src/operations/**"
require "../db/migrations/**"

APP_PORT = (ENV["APP_PORT"]? || "3000").to_i
APP_NAME = ENV["APP_NAME"]? || "production_line_report"
APP_ENV  = ENV["APP_ENV"]? || "development"

class AppDatabase < Avram::Database
end

AppDatabase.configure do |settings|
  if APP_ENV == "production"
    settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL"])
  else
    settings.credentials =
      Avram::Credentials.parse?(ENV["DATABASE_URL"]?) ||
        Avram::Credentials.new(
          database: "#{APP_NAME}_#{APP_ENV}",
          hostname: ENV["DB_HOST"]? || "localhost",
          port: ENV["DB_PORT"]?.try(&.to_i) || 5432,
          # Some common usernames are "postgres", "root", or your system username (run 'whoami')
          username: ENV["DB_USERNAME"]? || "postgres",
          # Some Postgres installations require no password. Use "" if that is the case.
          password: ENV["DB_PASSWORD"]? || "postgres"
        )
  end
  p! settings.credentials.database
  p! settings.credentials.url
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  case APP_ENV
  when "production"
    # In production, allow lazy loading (N+1).
    # In development and test, raise an error if you forget to preload associations
    settings.lazy_load_enabled = true
  when "development", "test"
    DB::Log.level = :debug
    Avram::QueryLog.dexter.configure(:debug)
  end

  # Always parse `Time` values with these specific formats.
  # Used for both database values, and datetime input fields.
  # settings.time_formats << "%F"
end

if ENV["LUCKY_TASK"]? != "true"
  Avram::Migrator::Runner.new.run_pending_migrations
end
