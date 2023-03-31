class Admin::Workshops::ShowPage < MainLayout
  needs workshop : Workshop
  needs process_lines : ProcessLineQuery
  quick_def page_title, "车间 ID: #{workshop.id}"

  def content
    link "返回车间列表", Index.with(workshop.manufactory_id)

    h1 page_title

    link "新产品线", to: Admin::ProcessLines::New.with(workshop.id)
    mount ProcessLineList, records: process_lines

    section do
      link "编辑", Edit.with(workshop.id)
      text " | "
      link "删除",
        Delete.with(workshop.id),
        data_confirm: "确认?"
    end

    ul do
      li do
        text "名称: "
        strong workshop.name.to_s
      end
    end
  end
end
