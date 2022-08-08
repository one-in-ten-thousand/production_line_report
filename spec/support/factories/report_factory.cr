class ReportFactory < Avram::Factory
  def initialize
    target_total_count rand(45..50)
    processed_total_count rand(42..45)
    qualifed_total_count rand(30..40)

    time = Time.utc(rand(2016..2021), rand(1..12), rand(1..29), rand(8..20), rand(1..59), rand(1..59))
    report_date time.day_of_year
    report_month time.date[1]
    report_week time.calendar_week[1]
  end
end
