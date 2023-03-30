class Admin::Workshops::Show < BrowserAction
  get "/admin/workshops/:workshop_id" do
    html ShowPage, workshop: WorkshopQuery.find(workshop_id)
  end
end
