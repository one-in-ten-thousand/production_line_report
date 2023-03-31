class Admin::ProcessLines::New < BrowserAction
  get "/admin/workshops/:workshop_id/process_lines/new" do
    html NewPage, operation: SaveProcessLine.new, workshop_id: workshop_id
  end
end
