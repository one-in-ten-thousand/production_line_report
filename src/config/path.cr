struct Path
  getter admin_home = "/admin/home"

  getter admin_company_index = "/admin/companies"
  getter admin_company = "/admin/companies/:id"
  getter admin_company_new = "/admin/companies/new"
  getter admin_company_edit = "/admin/companies/:id/edit"
  getter admin_company_delete = "/admin/companies/:id/delete"

  getter admin_manufactory_index = "admin/manufactories"
  getter admin_manufactory = "admin/manufactories/:id"
  getter admin_manufactory_new = "admin/manufactories/new"
  getter admin_manufactory_edit = "admin/manufactories/:id/edit"
  getter admin_manufactory_delete = "admin/manufactories/:id/delete"
end
