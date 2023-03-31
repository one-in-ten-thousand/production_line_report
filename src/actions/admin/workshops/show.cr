class Admin::Workshops::Show < BrowserAction
  get "/admin/workshops/:workshop_id" do
    process_lines = ProcessLineQuery.new.workshop_id(workshop_id)
    html ShowPage, workshop: WorkshopQuery.find(workshop_id), process_lines: process_lines
  end
end
