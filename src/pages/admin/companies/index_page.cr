class Admin::Companies::IndexPage < AdminLayout
  needs companies : CompanyQuery
  quick_def page_title, "公司列表"

  def content
    h1 page_title

    link "新公司", to: New

    mount RecordList,
      records: companies,
      show: Admin::Companies::Show,
      edit: Admin::Companies::Edit,
      delete: Admin::Companies::Delete,
      delete_msg: "删除公司同时会删除下属的工厂、车间、生产线，确认？"
  end
end
