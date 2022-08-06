module Admin::CompanyController
  macro included
    # 列表页
    get path.admin_company_index do |env|
      companies = CompanyQuery.new
      render_admin "admin/companies/index.ecr"
    end

    # 详情页
    get path.admin_company do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      manufactories = company.manufactories
      render_admin "admin/companies/show.ecr"
    end

    # 新记录
    get path.admin_company_new do |env|
      operation = SaveCompany.new
      errors = {} of Symbol => Array(String)

      render_admin "admin/companies/new.ecr"
    end
    post path.admin_company_new do |env|
      params = {
        name: env.params.body["company[name]"].as(String)
      }

      SaveCompany.create(**params) do |operation, _|
        if operation.saved?
          env.redirect path.admin_company_index
        else
          errors = operation.errors
          render_admin "admin/companies/new.ecr"
        end
      end
    end

    # 编辑
    get path.admin_company_edit do |env|
      operation = SaveCompany.new(CompanyQuery.find(env.params.url["company_id"]))
      errors = {} of Symbol => Array(String)

      render_admin "admin/companies/edit.ecr"
    end
    post path.admin_company_edit do |env|
      record = CompanyQuery.find(env.params.url["company_id"])
      params = {
        name: env.params.body["company[name]"].as(String)
      }

      SaveCompany.update(record, **params) do |operation, _|
        if operation.saved?
          env.redirect path.admin_company_index
        else
          errors = operation.errors
          render_admin "admin/companies/edit.ecr"
        end
      end
    end

    # 删除
    delete path.admin_company_delete do |env|
      company = CompanyQuery.find(env.params.url["company_id"])

      Company::DeleteOperation.delete!(company)

      env.redirect path.admin_company_index
    end
  end
end
