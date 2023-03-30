class Admin::Workshops::ShowPage < MainLayout
  needs workshop : Workshop
  quick_def page_title, "Workshop with id: #{workshop.id}"

  def content
    link "Back to all Workshops", Index.with(workshop.manufactory_id)
    h1 "Workshop with id: #{workshop.id}"
    render_actions
    render_workshop_fields
  end

  def render_actions
    section do
      link "Edit", Edit.with(workshop.id)
      text " | "
      link "Delete",
        Delete.with(workshop.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_workshop_fields
    ul do
      li do
        text "name: "
        strong workshop.name.to_s
      end
    end
  end
end
