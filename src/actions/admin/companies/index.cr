class Admin::Companies::Index < BrowserAction
  get "/admin/companies" do
    html IndexPage, companies: CompanyQuery.new
  end
end
