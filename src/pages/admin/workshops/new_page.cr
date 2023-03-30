class Admin::Workshops::NewPage < MainLayout
  needs operation : SaveWorkshop
  needs manufactory_id : String
  quick_def page_title, "New Workshop"

  def content
    h1 "New Workshop"
    render_workshop_form(operation)
  end

  def render_workshop_form(op)
    form_for Create.with(manufactory_id) do
      # Edit fields in src/components/admin/workshops/form_fields.cr
      mount FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
