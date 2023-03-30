class Admin::Workshops::New < BrowserAction
  get "/admin/manufactories/:manufactory_id/workshops/new" do
    manufactory = ManufactoryQuery.find(manufactory_id)
    html NewPage, operation: SaveWorkshop.new, manufactory_id: manufactory_id
  end
end
