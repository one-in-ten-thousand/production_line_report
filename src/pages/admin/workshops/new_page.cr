class Admin::Workshops::NewPage < MainLayout
  needs operation : SaveWorkshop
  needs manufactory_id : String
  quick_def page_title, "新的车间"

  def content
    link "所有车间", Index.with(manufactory_id)

    h1 page_title

    form_for Create.with(manufactory_id) do
      mount FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
