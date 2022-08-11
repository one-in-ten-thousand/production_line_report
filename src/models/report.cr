class Report < BaseModel
  table do
    column target_total_count : Int32
    column processed_total_count : Int32
    column qualified_total_count : Int32
    column report_date : String
    column report_year_num : Int32
    column report_month_num : Int32
    column report_week_num : Int32

    belongs_to process_line : ProcessLine
    belongs_to workshop : Workshop
    belongs_to manufactory : Manufactory
    belongs_to company : Company
  end

  def products
    ProductQuery.new.report_date(report_date)
  end
end
