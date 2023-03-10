class SaveProduct < Product::SaveOperation
  before_save do
    process_line = ProcessLineQuery.new.find(process_line_id.value.not_nil!)

    workshop_id.value = process_line.workshop_id
    manufactory_id.value = process_line.manufactory_id
    company_id.value = process_line.company_id
  end
end
