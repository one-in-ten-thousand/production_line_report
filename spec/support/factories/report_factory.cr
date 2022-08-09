class ReportFactory < Avram::Factory
  def initialize
    target_total_count rand(45..50)
    processed_total_count rand(42..45)
    qualified_total_count rand(30..40)

    time = Time.utc
    date_str = ""

    loop do
      time = Time.utc(rand(2016..2021), rand(1..12), rand(1..29), rand(8..20), rand(1..59), rand(1..59))
      date_str = time.to_s("%Y-%d-%m")

      break unless ReportQuery.new.report_date(date_str).first?
    end

    report_date date_str
    report_year_num time.year
    report_month_num time.month
    report_week_num time.calendar_week[1]
  end
end
