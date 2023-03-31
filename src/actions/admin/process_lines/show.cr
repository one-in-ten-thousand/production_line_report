class Admin::ProcessLines::Show < BrowserAction
  get "/admin/process_lines/:process_line_id" do
    html ShowPage, process_line: ProcessLineQuery.find(process_line_id)
  end
end
