class Admin::ProcessLines::Edit < BrowserAction
  get "/admin/process_lines/:process_line_id/edit" do
    process_line = ProcessLineQuery.find(process_line_id)
    html EditPage,
      operation: SaveProcessLine.new(process_line),
      process_line: process_line
  end
end
