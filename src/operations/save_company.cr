class SaveCompany < Company::SaveOperation
  before_save do
    validate_uniqueness_of name, message: "已经存在"
  end
end
