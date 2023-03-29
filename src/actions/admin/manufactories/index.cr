class Admin::Manufactories::Index < BrowserAction
  get "/admin/companies/:company_id/manufactories" do
    manufactories = ManufactoryQuery.new.company_id(company_id)
    html IndexPage, manufactories: manufactories
  end
end
