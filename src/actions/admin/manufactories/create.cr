class Admin::Manufactories::Create < BrowserAction
  post "/admin/companies/:company_id/manufactories" do
    SaveManufactory.create(params, company_id: company_id.to_i64) do |operation, manufactory|
      if manufactory
        flash.success = "创建成功"
        redirect Index.with(company_id: company_id)
      else
        flash.failure = "表单不合法: #{operation.errors}"
        html NewPage, operation: operation, company_id: company_id
      end
    end
  end
end
