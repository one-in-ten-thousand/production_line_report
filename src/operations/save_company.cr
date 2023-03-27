class SaveCompany < Company::SaveOperation
  permit_columns name

  before_save do
    validate_uniqueness_of name, message: "已经存在"
  end
end
