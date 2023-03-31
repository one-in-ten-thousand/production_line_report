class Admin::ProcessLines::ShowPage < MainLayout
  needs process_line : ProcessLine
  quick_def page_title, "产品线 ID: #{process_line.id}"

  def content
    link "所有产品线", Index.with(process_line.workshop_id)

    h1 page_title

    section do
      link "编辑", Edit.with(process_line.id)
      text " | "
      link "删除",
        Delete.with(process_line.id),
        data_confirm: "确认?"
    end

    ul do
      li do
        text "名称: "
        strong process_line.name.to_s
      end
    end
  end
end
