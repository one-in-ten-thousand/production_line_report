class Admin::ProcessLines::IndexPage < MainLayout
  needs process_lines : ProcessLineQuery
  needs workshop_id : String
  quick_def page_title, "所有生产线"

  def content
    h1 page_title

    link "新生产线", New.with(workshop_id)

    mount ProcessLineList, records: process_lines
  end
end
