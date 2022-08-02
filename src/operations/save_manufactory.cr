class SaveManufactory < Manufactory::SaveOperation
  # before_save validate_name_is_unique

  # def validate_name_is_unique

  # end

  # before_save do
  #   validate_uniqueness_of name, query: ManufactoryQuery.new.id(id), message: "已经存在"
  # end
end
