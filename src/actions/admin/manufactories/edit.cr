class Admin::Manufactories::Edit < BrowserAction
  get "/admin/manufactories/:manufactory_id/edit" do
    manufactory = ManufactoryQuery.find(manufactory_id)

    html EditPage,
      operation: SaveManufactory.new(manufactory),
      manufactory: manufactory
  end
end
