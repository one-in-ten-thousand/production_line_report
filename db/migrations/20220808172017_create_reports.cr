class CreateReports::V20220808172017 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Report) do
      primary_key id : Int64
      add target_total_count : Int32
      add processed_total_count : Int32
      add qualified_total_count : Int32
      add report_date : String, unique: true
      add report_year_num : Int32, index: true
      add report_month_num : Int32, index: true
      add report_week_num : Int32, index: true
      add_belongs_to process_line : ProcessLine, on_delete: :cascade
      add_belongs_to workshop : Workshop, on_delete: :cascade
      add_belongs_to manufactory : Manufactory, on_delete: :cascade
      add_belongs_to company : Company, on_delete: :cascade
      add_timestamps
    end
  end

  def rollback
    drop table_for(Report)
  end
end
