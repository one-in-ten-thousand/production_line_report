class Admin::Companies::Delete < BrowserAction
  delete "/admin/companies/:company_id" do
    company = CompanyQuery.find(company_id)

    DeleteCompany.delete(company) do |_operation, _deleted|
      flash.success = "删除成功"
      redirect Index
    end
  end
end
