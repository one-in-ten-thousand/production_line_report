class ReportFactory < Avram::Factory
  def initialize
    target_total_count rand(45..50)
    processed_total_count rand(42..45)
    qualified_total_count rand(30..40)

    time = Time.utc
    date_str = ""

    before_save do
      if operation.report_date.value.nil?
        loop do
          time = Time.utc(rand(2020..2021), rand(1..12), rand(1..28), rand(8..20), rand(1..59), rand(1..59))
          date_str = time.to_s("%F")

          break unless ReportQuery.new.report_date(date_str).first?
        end

        report_date date_str
        report_year_num time.year
        report_month_num time.month
        report_week_num time.calendar_week[1]
      end

      id = operation.process_line_id.value

      if id.nil?
        process_line = ProcessLineFactory.create
      else
        process_line = ProcessLineQuery.new.find(id)
      end

      process_line_id process_line.id
      workshop_id process_line.workshop_id
      manufactory_id process_line.manufactory_id
      company_id process_line.company_id
    end
  end
end
