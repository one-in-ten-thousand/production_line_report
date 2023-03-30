class Admin::Manufactories::Delete < BrowserAction
  delete "/admin/manufactories/:manufactory_id" do
    manufactory = ManufactoryQuery.find(manufactory_id)

    DeleteManufactory.delete(manufactory) do |_operation, _delete|
      flash.success = "删除工厂成功"
      redirect Index.with(company_id: manufactory.company_id)
    end
  end
end
