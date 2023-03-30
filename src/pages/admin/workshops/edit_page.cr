class Admin::Workshops::EditPage < MainLayout
  needs operation : SaveWorkshop
  needs workshop : Workshop
  quick_def page_title, "Edit Workshop with id: #{workshop.id}"

  def content
    link "Back to all Workshops", Index.with(workshop.manufactory_id)
    h1 "Edit Workshop with id: #{workshop.id}"
    render_workshop_form(operation)
  end

  def render_workshop_form(op)
    form_for Update.with(workshop.id) do
      # Edit fields in src/components/admin/workshops/form_fields.cr
      mount FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
