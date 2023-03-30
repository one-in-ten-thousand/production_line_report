class Admin::Companies::ShowPage < MainLayout
  needs company : Company
  needs manufactories : ManufactoryQuery
  quick_def page_title, "详情"

  def content
    link "返回公司列表", Index
    h1 company.name

    link "新工厂", to: Admin::Manufactories::New.with(company_id: company.id)

    mount ManufactoryList, records: manufactories

    section do
      link "编辑", Edit.with(company_id: company.id)
      text " | "
      link "删除", Delete.with(company.id), data_confirm: "确认?"
    end
  end
end
