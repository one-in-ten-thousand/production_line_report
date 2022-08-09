class CreateProducts::V20220808175139 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Product) do
      primary_key id : Int64
      add name : String
      add place : Int32, default: 0
      add reason : Int32, default: 0
      add_belongs_to report : Report, on_delete: :cascade
      add_timestamps
    end

    create_index table_for(Product), [:place, :reason]
  end

  def rollback
    # drop table_for(Thing)
  end
end
