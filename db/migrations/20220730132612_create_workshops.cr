class CreateWorkshops::V20220730132612 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Workshop) do
      primary_key id : Int64
      add name : String
      add_belongs_to company : Company, on_delete: :cascade
      add_belongs_to manufactory : Manufactory, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(Workshop)
  end
end
