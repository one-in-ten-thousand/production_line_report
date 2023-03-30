class Admin::Workshops::IndexPage < MainLayout
  needs workshops : WorkshopQuery
  needs manufactory_id : String
  quick_def page_title, "All Workshops"

  def content
    h1 "All Workshops"
    link "New Workshop", New.with(manufactory_id)
    mount WorkshopList, records: workshops
  end
end
