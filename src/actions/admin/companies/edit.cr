class Admin::Companies::Edit < BrowserAction
  get "/admin/companies/:company_id/edit" do
    company = CompanyQuery.find(company_id)

    html EditPage,
      operation: SaveCompany.new(company),
      company: company
  end
end
