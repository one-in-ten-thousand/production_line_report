class Admin::Manufactories::Show < BrowserAction
  get "/admin/manufactories/:manufactory_id" do
    manufactory = ManufactoryQuery.find(manufactory_id)
    workshops = WorkshopQuery.new.manufactory_id(manufactory_id)
    html ShowPage, manufactory: manufactory, workshops: workshops
  end
end
