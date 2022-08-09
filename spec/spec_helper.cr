ENV["APP_ENV"] = "test"
require "spec-kemal"
require "../src/production_line_report"
require "../spec/support/**"

Avram::Migrator::Runner.new.ensure_migrated!

Spec.before_each do
  AppDatabase.truncate
end
