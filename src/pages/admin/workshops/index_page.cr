class Admin::Workshops::IndexPage < MainLayout
  needs workshops : WorkshopQuery
  needs manufactory_id : String
  quick_def page_title, "所有车间"

  def content
    h1 page_title

    link "新车间", New.with(manufactory_id)

    mount WorkshopList, records: workshops
  end
end
