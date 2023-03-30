class Admin::Manufactories::EditPage < MainLayout
  needs operation : SaveManufactory
  needs manufactory : Manufactory
  quick_def page_title, "编辑工厂 #{manufactory.id}"

  def content
    h1 "编辑工厂"
    link "返回", Index.with(company_id: manufactory.company_id)

    form_for Update.with(manufactory_id: manufactory) do
      mount FormFields, operation

      submit "提交", data_disable_with: "更新中 ..."
    end
  end
end
