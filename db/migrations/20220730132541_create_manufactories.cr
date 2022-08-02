class CreateManufactories::V20220730132541 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Manufactory) do
      primary_key id : Int64
      add name : String
      add_belongs_to company : Company, on_delete: :cascade
      add_timestamps
    end
    create_index table_for(Manufactory), [:name, :company_id], unique: true
  end

  def rollback
    drop table_for(Manufactory)
  end
end
