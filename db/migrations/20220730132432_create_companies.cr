class CreateCompanies::V20220730132432 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Company) do
      primary_key id : Int64
      add name : String
      add_timestamps
    end
  end

  def rollback
    drop table_for(Company)
  end
end
