class CreateUnqualifiedProducts::V20220808175139 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(UnqualifiedProduct) do
      primary_key id : Int64
      add place : Int32
      add reason : Int32
      add_belongs_to report : Report, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    # drop table_for(Thing)
  end
end
