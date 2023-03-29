class SaveWorkshop < Workshop::SaveOperation
  permit_columns name

  before_save do
    validate_uniqueness_of name, query: WorkshopQuery.new.manufactory_id.nilable_eq(manufactory_id.value), message: "已经存在"
  end
end
