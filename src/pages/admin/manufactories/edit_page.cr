class Admin::Manufactories::EditPage < MainLayout
  needs operation : SaveManufactory
  needs manufactory : Manufactory
  quick_def page_title, "编辑工厂 #{manufactory.id}"

  def content
    link "所有工厂", Index.with(company_id: manufactory.company_id)

    h1 page_title

    form_for Update.with(manufactory_id: manufactory) do
      mount FormFields, operation

      submit "修改", data_disable_with: "更新中 ..."
    end
  end
end
