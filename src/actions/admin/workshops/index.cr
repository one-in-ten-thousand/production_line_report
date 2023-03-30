class Admin::Workshops::Index < BrowserAction
  get "/admin/manufactories/:manufactory_id/workshops" do
    html IndexPage, workshops: WorkshopQuery.new, manufactory_id: manufactory_id
  end
end
