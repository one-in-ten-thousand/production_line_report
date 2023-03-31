class Admin::ProcessLines::NewPage < MainLayout
  needs operation : SaveProcessLine
  needs workshop_id : String
  quick_def page_title, "新的产品线"

  def content
    link "所有产品线", Index.with(workshop_id)

    h1 page_title

    form_for Create.with(workshop_id) do
      mount FormFields, operation

      submit "提交", data_disable_with: "保存中..."
    end
  end
end
