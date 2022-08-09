class ReportFactory < Avram::Factory
  def initialize
    target_total_count rand(45..50)
    processed_total_count rand(42..45)
    qualified_total_count rand(30..40)

    time = Time.utc
    date_str = ""

    loop do
      time = Time.utc(rand(2016..2021), rand(1..12), rand(1..28), rand(8..20), rand(1..59), rand(1..59))
      date_str = time.to_s("%Y-%m-%d")

      break unless ReportQuery.new.report_date(date_str).first?
    end

    report_date date_str
    report_year_num time.year
    report_month_num time.month
    report_week_num time.calendar_week[1]

    before_save do
      if operation.process_line_id.value.nil?
        process_line = ProcessLineFactory.create

        process_line_id process_line.id
        workshop_id process_line.workshop.id
        manufactory_id process_line.workshop.manufactory.id
        company_id process_line.workshop.manufactory.company.id
      end
    end
  end
end