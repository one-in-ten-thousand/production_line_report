class Admin::Workshops::IndexPage < MainLayout
  needs workshops : WorkshopQuery
  needs manufactory_id : String
  quick_def page_title, "All Workshops"

  def content
    h1 "All Workshops"
    link "New Workshop", New.with(manufactory_id)
    render_workshops
  end

  def render_workshops
    ul do
      workshops.each do |workshop|
        li do
          link workshop.name, Show.with(workshop)
        end
      end
    end
  end
end
