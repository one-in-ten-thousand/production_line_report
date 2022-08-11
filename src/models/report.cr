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
    ProductQuery.new.process_line_id(process_line.id).report_date(report_date)
  end

  # 合格率 = 良品/车缝
  def qualified_processed_rate
    (qualified_total_count.to_f/processed_total_count).to_big_d.round(4)
  end

  # 不合格率 = 1 - 合格率
  def unqualified_processed_rate
    1 - qualified_processed_rate
  end

  # 车缝完成率 = 车缝/目标
  def processed_rate
    (processed_total_count.to_f/target_total_count).to_big_d.round(4)
  end

  # 良品完成率 = 良品/目标
  def qualified_target_rate
    (qualified_total_count.to_f/target_total_count).to_big_d.round(4)
  end

  def rework_total_count
    processed_total_count - qualified_total_count
  end
end
