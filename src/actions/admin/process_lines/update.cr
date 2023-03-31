class Admin::ProcessLines::Update < BrowserAction
  put "/admin/process_lines/:process_line_id" do
    process_line = ProcessLineQuery.find(process_line_id)
    SaveProcessLine.update(process_line, params) do |operation, updated_process_line|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_process_line.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, process_line: updated_process_line
      end
    end
  end
end
