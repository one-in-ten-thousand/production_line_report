class Admin::Companies::Show < BrowserAction
  get "/admin/companies/:company_id" do
    html ShowPage, company: CompanyQuery.find(company_id)
  end
end
