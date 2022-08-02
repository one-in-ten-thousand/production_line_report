class SaveManufactory < Manufactory::SaveOperation
  before_save do
    validate_uniqueness_of name, query: ManufactoryQuery.new.company_id.nilable_eq(company_id.value), message: "已经存在"
  end
end
