class Admin::Companies::Show < BrowserAction
  get "/admin/companies/:company_id" do
    company = CompanyQuery.find(company_id)
    manufactories = ManufactoryQuery.new.company_id(company_id)
    html ShowPage, company: company, manufactories: manufactories
  end
end
