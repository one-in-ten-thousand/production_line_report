macro create_crud_path(singular_name, plural_name, namespace = "", nested = "")
  {% if namespace == "" %}
    {% sep1 = "" %}
    {% sep2 = "" %}
  {% else %}
    {% sep1 = "_" %}
    {% sep2 = "/" %}
  {% end %}

  # nested_ids 从 nested 字符串中，提取出来所有的 :placeholder, 作为一个 Array 返回
  # 例如：["company_id", "manufactory_id", "workshop_id"]
  {% if nested == "" %}
    {% sep3 = "" %}
    {% nested_ids = "[] of String" %}
  {% else %}
    {% sep3 = "/" %}
    {% nested_ids = ("/" + nested).gsub(%r{/[^:]+}, "").gsub(/^:/, "").split(":") %}
  {% end %}

  macro generate_url_method(path, nested_ids)
    # args1 返回 placeholder 拼接成逗号分隔后的形式，
    # 例如：company_id, manufactory_id, workshop_id
    \{% args = "" %}
    \{% for id, _ in nested_ids %}
      \{% args += ", " + id %}
    \{% end %}

    \{% if args == "" %}
      \{% args1 = "" %}
    \{% else %}
      \{% args1 = args[1..] %}
    \{% end %}

    # 定义 ???_for 方法, 例如；
    # generate_url_method admin_report_edit, ["company_id", "manufactory_id", "workshop_id", "process_line_id"] of ::String
    # 会创建一个方法叫做：admin_report_edit_for(*, company_id, manufactory_id, workshop_id, process_line_id)
    # 这个方法典型的用途是在 view 里面生成一个链接
    # 调用这个方法，会生成 /companies/10/manufactories/10/workshops/10/process_lines/10
    def \{{path.id}}_for(*, {{singular_name.id}}_id, \{{args1.id}}) : String
      result = \{{path.id}}.sub(":{{singular_name.id}}_id", {{singular_name.id}}_id)

      \{% for id, _ in nested_ids %}
        result = result.sub(":\{{id.id}}", \{{id.id}})
      \{% end %}

      result
    end
  end

# 和上面类似，区别是少个参数，不用传递当前对象的 id
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
  end

  {% n1 = namespace + sep1 + singular_name %}
  {% n2 = namespace + sep2 + nested + sep3 + plural_name %}
  {% n3 = namespace + sep2 + plural_name %}

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

  getter {{n1.id}}_delete = "/{{n3.id}}/:{{singular_name.id}}_id/delete"
  generate_url_method {{n1.id}}_delete, [] of String
end

struct RoutePath
  create_crud_path("company", "companies", "admin")
  create_crud_path("manufactory", "manufactories", "admin", "companies/:company_id")
  create_crud_path("workshop", "workshops", "admin", "companies/:company_id/manufactories/:manufactory_id")
  create_crud_path("process_line", "process_lines", "admin", "companies/:company_id/manufactories/:manufactory_id/workshops/:workshop_id")
  create_crud_path("report", "reports", "admin", "companies/:company_id/manufactories/:manufactory_id/workshops/:workshop_id/process_lines/:process_line_id")
  create_crud_path("product", "products", "admin", "companies/:company_id/manufactories/:manufactory_id/workshops/:workshop_id/process_lines/:process_line_id/reports/:report_id")
end
