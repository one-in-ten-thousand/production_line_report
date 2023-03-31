class Admin::ProcessLines::FormFields < BaseComponent
  needs operation : SaveProcessLine

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")
  end
end
