class Admin::Manufactories::IndexPage < MainLayout
  needs manufactories : ManufactoryQuery
  needs company_id : String
  quick_def page_title, "工厂列表"

  def content
    h1 "工厂列表"

    link "新工厂", to: New.with(company_id: company_id)

    mount ManufactoryList, records: manufactories
  end
end
