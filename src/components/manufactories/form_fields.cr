class Manufactory::FormFields < BaseComponent
  needs operation : SaveManufactory

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")
  end
end
