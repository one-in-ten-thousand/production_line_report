class Admin::Workshops::FormFields < BaseComponent
  needs operation : SaveWorkshop

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")
  end
end
