class Admin::Companies::Update < BrowserAction
  put "/admin/companies/:company_id" do
    company = CompanyQuery.find(company_id)

    SaveCompany.update(company, params) do |operation, updated_company|
      if operation.saved?
        flash.success = "更新成功"
        redirect Index
      else
        flash.failure = "表单不合法"
        html EditPage, operation: operation, company: updated_company
      end
    end
  end
end
