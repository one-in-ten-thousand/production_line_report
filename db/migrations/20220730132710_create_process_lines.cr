class CreateProcessLines::V20220730132710 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(ProcessLine) do
      primary_key id : Int64
      add name : String
      add_belongs_to company : Company, on_delete: :cascade
      add_belongs_to manufactory : Manufactory, on_delete: :cascade
      add_belongs_to workshop : Workshop, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(ProcessLine)
  end
end
