class Admin::Manufactories::Update < BrowserAction
  put "/admin/manufactories/:manufactory_id" do
    manufactory = ManufactoryQuery.find(manufactory_id)

    SaveManufactory.update(manufactory, params) do |operation, updated_manufactory|
      if operation.saved?
        flash.success = "更新成功"
        redirect Index.with(company_id: manufactory.company_id)
      else
        flash.failure = "表单不合法"
        html EditPage, operation: operation, manufactory: updated_manufactory
      end
    end
  end
end
