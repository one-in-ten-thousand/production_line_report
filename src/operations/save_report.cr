class SaveReport < Report::SaveOperation
  before_save do
    validate_uniqueness_of report_date, message: "已经存在"
  end
end
