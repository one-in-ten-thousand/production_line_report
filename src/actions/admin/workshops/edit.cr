class Admin::Workshops::Edit < BrowserAction
  get "/admin/workshops/:workshop_id/edit" do
    workshop = WorkshopQuery.find(workshop_id)
    html EditPage,
      operation: SaveWorkshop.new(workshop),
      workshop: workshop
  end
end
