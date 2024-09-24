class Admin::ProcessLines::IndexPage < AdminLayout
  needs process_lines : ProcessLineQuery
  needs workshop_id : String
  quick_def page_title, "所有生产线"

  def content
    h1 page_title

    link "新生产线", New.with(workshop_id)

    mount RecordList,
      records: process_lines,
      show: Admin::ProcessLines::Show,
      edit: Admin::ProcessLines::Edit,
      delete: Admin::ProcessLines::Delete,
      delete_msg: "删除生产线，确认？"
  end
end
