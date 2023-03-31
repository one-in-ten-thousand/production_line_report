class Admin::ProcessLines::EditPage < MainLayout
  needs operation : SaveProcessLine
  needs process_line : ProcessLine
  quick_def page_title, "编辑生产线 ID: #{process_line.id}"

  def content
    link "所有生产线", Index.with(process_line.workshop_id)

    h1 page_title

    form_for Update.with(process_line.id) do
      mount FormFields, operation

      submit "修改", data_disable_with: "更新中..."
    end
  end
end
