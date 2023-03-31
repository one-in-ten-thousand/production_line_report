class Admin::Manufactories::NewPage < MainLayout
  needs operation : SaveManufactory
  needs company_id : String
  quick_def page_title, "新的工厂"

  def content
    link "所有工厂", Index.with(company_id)

    h1 page_title

    form_for Create.with(company_id) do
      mount FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
