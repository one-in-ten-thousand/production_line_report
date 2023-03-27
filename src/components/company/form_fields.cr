class Company::FormFields < BaseComponent
  needs operation : SaveCompany

  def render
    mount Shared::Field, operation.name, &.text_input(autofocus: "true")
  end
end
