macro create_crud_path(singular_name, plural_name, namespace="", nested="")
  {% if namespace == "" %}
    {% sep1 = "" %}
    {% sep2 = "" %}
  {% else %}
    {% sep1 = "_" %}
    {% sep2 = "/" %}
  {% end %}

  {% if nested == "" %}
    {% sep3 = "" %}
    {% nested_ids = "[] of String" %}
  {% else %}
    {% sep3 = "/" %}

    {% nested_ids = ("/" + nested).gsub(%r{/[^:]+}, "").gsub(/^:/, "").split(":") %}
  {% end %}

  macro generate_url_method(path, nested_ids)
    \{% args = "" %}
    \{% for id, _ in nested_ids %}
      \{% args += ", " + id %}
    \{% end %}

    \{% if args == "" %}
      \{% args1 = "" %}
    \{% else %}
      \{% args1 = args[1..] %}
    \{% end %}

    def \{{path.id}}_for(*, {{singular_name.id}}_id, \{{args1.id}}) : String
      result = \{{path.id}}.sub(":{{singular_name.id}}_id", {{singular_name.id}}_id)

      \{% for id, _ in nested_ids %}
        result = result.sub(":\{{id.id}}", \{{id.id}})
      \{% end %}

      result
    end
    \{% debug %}
  end

macro generate_nested_method(path, nested_ids)
    \{% args = "" %}
    \{% for id, _ in nested_ids %}
      \{% args += ", " + id %}
    \{% end %}

    \{% if args == "" %}
      \{% args1 = "" %}
    \{% else %}
      \{% args1 = args[1..] %}
    \{% end %}

    def \{{path.id}}_for(*, \{{args1.id}}) : String
      result = \{{path.id}}

      \{% for id, _ in nested_ids %}
        result = result.sub(":\{{id.id}}", \{{id.id}})
      \{% end %}

      result
    end
    \{% debug %}
  end


                                                      {% n1 = namespace + sep1 + singular_name %}
                                                      {% n2 = namespace + sep2 + nested + sep3 + plural_name %}

  getter {{n1.id}}_index = "/{{n2.id}}"
  {% if nested != "" %}
    generate_nested_method {{n1.id}}_index, {{nested_ids.id}}
  {% end %}



  getter {{n1.id}} = "/{{n2.id}}/:{{singular_name.id}}_id"
  generate_url_method {{n1.id}}, {{nested_ids.id}}

  getter {{n1.id}}_new = "/{{n2.id}}/new"
   {% if nested != "" %}
    generate_nested_method {{n1.id}}_new, {{nested_ids.id}}
  {% end %}


  getter {{n1.id}}_edit = "/{{n2.id}}/:{{singular_name.id}}_id/edit"
  generate_url_method {{n1.id}}_edit, {{nested_ids.id}}

  getter {{n1.id}}_delete = "/{{n2.id}}/:{{singular_name.id}}_id/delete"
  generate_url_method {{n1.id}}_delete, {{nested_ids.id}}
  {% debug %}
end

struct RoutePath
  create_crud_path("company", "companies", "admin")
  create_crud_path("manufactory", "manufactories", "admin", "companies/:company_id")
  create_crud_path("workshop", "workshops", "admin", "companies/:company_id/manufactories/:manufactory_id")
end
