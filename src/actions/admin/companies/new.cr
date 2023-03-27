class Admin::Companies::New < BrowserAction
  get "/admin/companies/new" do
    html NewPage, operation: SaveCompany.new
  end
end
