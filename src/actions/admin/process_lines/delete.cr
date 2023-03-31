class Admin::ProcessLines::Delete < BrowserAction
  delete "/admin/process_lines/:process_line_id" do
    process_line = ProcessLineQuery.find(process_line_id)
    DeleteProcessLine.delete(process_line) do |_operation, _deleted|
      flash.success = "Deleted the process_line"
      redirect Index.with(process_line.workshop_id)
    end
  end
end
