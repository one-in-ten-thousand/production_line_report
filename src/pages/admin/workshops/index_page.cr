class Admin::Workshops::IndexPage < AdminLayout
  needs workshops : WorkshopQuery
  needs manufactory_id : String
  quick_def page_title, "所有车间"

  def content
    h1 page_title

    link "新车间", New.with(manufactory_id)

    mount RecordList,
      records: workshops,
      show: Admin::Workshops::Show,
      edit: Admin::Workshops::Edit,
      delete: Admin::Workshops::Delete,
      delete_msg: "删除车间同时会删除下属的生产线，确认？"
  end
end
