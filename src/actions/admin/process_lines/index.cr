class Admin::ProcessLines::Index < BrowserAction
  get "/admin/workshops/:workshop_id/process_lines" do
    html IndexPage, process_lines: ProcessLineQuery.new, workshop_id: workshop_id
  end
end
