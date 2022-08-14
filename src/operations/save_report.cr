class SaveReport < Report::SaveOperation
  upsert_lookup_columns :report_date

  before_save do
    validate_uniqueness_of report_date, message: "已经存在"

    time = Time.parse_local(report_date.value.not_nil!, "%F")
    report_year_num.value = time.year
    report_month_num.value = time.month
    report_week_num.value = time.calendar_week[1]

    process_line = ProcessLineQuery.new.find(process_line_id.value.not_nil!)

    workshop_id.value = process_line.workshop.id
    manufactory_id.value = process_line.workshop.manufactory.id
    company_id.value = process_line.workshop.manufactory.company.id
  end
end
