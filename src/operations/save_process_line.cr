class SaveProcessLine < ProcessLine::SaveOperation
  before_save do
    validate_uniqueness_of name, query: ProcessLineQuery.new.workshop_id.nilable_eq(workshop_id.value), message: "已经存在"
  end
end
