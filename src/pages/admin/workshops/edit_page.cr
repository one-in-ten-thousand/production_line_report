class Admin::Workshops::EditPage < MainLayout
  needs operation : SaveWorkshop
  needs workshop : Workshop
  quick_def page_title, "编辑车间 ID: #{workshop.id}"

  def content
    link "所有车间", Index.with(workshop.manufactory_id)

    h1 page_title

    form_for Update.with(workshop.id) do
      mount FormFields, operation

      submit "修改", data_disable_with: "更新中..."
    end
  end
end
