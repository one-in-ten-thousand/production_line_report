class Admin::Manufactories::IndexPage < AdminLayout
  needs manufactories : ManufactoryQuery
  needs company_id : String
  quick_def page_title, "工厂列表"

  def content
    h1 page_title

    link "新工厂", to: New.with(company_id)

    mount RecordList,
      records: manufactories,
      show: Admin::Manufactories::Show,
      edit: Admin::Manufactories::Edit,
      delete: Admin::Manufactories::Delete,
      delete_msg: "删除工厂同时会删除下属的车间、生产线，确认？"
  end
end
