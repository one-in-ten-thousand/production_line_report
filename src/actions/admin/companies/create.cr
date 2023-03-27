class Admin::Companies::Create < BrowserAction
  post "/admin/companies/create" do
    SaveCompany.create(params) do |operation, company|
      if company
        flash.success = "创建成功"
        redirect Index
      else
        flash.failure = "表单不合法"
        html NewPage, operation: operation
      end
    end
  end
end
