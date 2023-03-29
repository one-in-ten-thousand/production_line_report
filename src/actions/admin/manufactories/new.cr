class Admin::Manufactories::New < BrowserAction
  get "/admin/companies/:company_id/manufactories/new" do
    operation = SaveManufactory.new

    html NewPage, operation: operation, company_id: company_id
  end
end
