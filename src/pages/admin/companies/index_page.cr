class Admin::Companies::IndexPage < MainLayout
  needs companies : CompanyQuery
  quick_def page_title, "公司列表"

  def content
    h1 page_title

    link "新公司", to: New

    mount CompanyList, records: companies
  end
end
