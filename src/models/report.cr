class Report < BaseModel
  table do
    column target_total_count : Int32
    column processed_total_count : Int32
    column qualifed_total_count : Int32
    column report_date : Int32
    column report_month : Int32
    column report_week : Int32

    has_many unqualifed_products : UnqualifedProduct
    belongs_to process_line : ProcessLine
    belongs_to workshop : Workshop
    belongs_to manufactory : Manufactory
    belongs_to company : Company
  end
end
