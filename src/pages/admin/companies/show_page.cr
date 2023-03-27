class Admin::Companies::ShowPage < MainLayout
  needs company : Company
  quick_def page_title, "详情"

  def content
    link "返回列表", Index
    h1 company.name

    # render Admin::Manufactories::IndexPage

    section do
      link "编辑", Edit.with(company.id)
      text " | "
      link "删除", Delete.with(company.id), data_confirm: "确认?"
    end
  end
end
