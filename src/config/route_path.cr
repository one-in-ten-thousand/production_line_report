macro create_crud_path(singular_name, plural_name, namespace)
  {% if namespace == nil %}
    {% sep1 = "" %}
    {% sep2 = "" %}
  {% else %}
    {% sep1 = "_" %}
    {% sep2 = "/" %}
  {% end %}

  getter {{namespace.id}}{{sep1.id}}{{singular_name.id}}_index = "/{{namespace.id}}{{sep2.id}}{{plural_name.id}}"

  getter {{namespace.id}}{{sep1.id}}{{singular_name.id}} = "/{{namespace.id}}{{sep2.id}}{{plural_name.id}}/:{{singular_name.id}}_id"
  def {{namespace.id}}{{sep1.id}}{{singular_name.id}}_for(id) : String
    {{namespace.id}}{{sep1.id}}{{singular_name.id}}.sub(":{{singular_name.id}}_id", id)
  end

  getter {{namespace.id}}{{sep1.id}}{{singular_name.id}}_new = "/{{namespace.id}}{{sep2.id}}{{plural_name.id}}/new"

  getter {{namespace.id}}{{sep1.id}}{{singular_name.id}}_edit = "/{{namespace.id}}{{sep2.id}}{{plural_name.id}}/:{{singular_name.id}}_id/edit"
  def {{namespace.id}}{{sep1.id}}{{singular_name.id}}_edit_for(id) : String
    {{namespace.id}}{{sep1.id}}{{singular_name.id}}_edit.sub(":{{singular_name.id}}_id", id)
  end

  getter {{namespace.id}}{{sep1.id}}{{singular_name.id}}_delete = "/{{namespace.id}}{{sep2.id}}{{plural_name.id}}/:{{singular_name.id}}_id/delete"
  def {{namespace.id}}{{sep1.id}}{{singular_name.id}}_delete_for(id) : String
    {{namespace.id}}{{sep1.id}}{{singular_name.id}}_delete.sub(":{{singular_name.id}}_id", id)
  end
end

struct RoutePath
  create_crud_path("company", "companies", "admin")
  create_crud_path("manufactory", "manufactories", "admin")
end
