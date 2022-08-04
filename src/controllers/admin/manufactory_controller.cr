module Admin::ManufactoryController
  macro included
    # 列表页
    get path.admin_manufactory_index do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      manufactories = ManufactoryQuery.new
      render_admin "admin/manufactories/index.ecr"
    end

    # 详情页
    get path.admin_manufactory do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      render_admin "admin/manufactories/show.ecr"
    end

    # 新记录
    get path.admin_manufactory_new do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      operation = SaveManufactory.new
      errors = {} of Symbol => Array(String)

      render_admin "admin/manufactories/new.ecr"
    end
    post path.admin_manufactory_new do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      params = {
        name: env.params.body["manufactory[name]"].as(String),
        company_id: company.id
      }

      SaveManufactory.create(**params) do |operation, manufactory|
        if operation.saved?
          env.redirect path.admin_company_for(company_id: company.id)
        else
          errors = operation.errors
          render_admin "admin/manufactories/new.ecr"
        end
      end
    end

    # 编辑
    get path.admin_manufactory_edit do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      operation = SaveManufactory.new(ManufactoryQuery.find(env.params.url["manufactory_id"]))
      errors = {} of Symbol => Array(String)

      render_admin "admin/manufactories/edit.ecr"
    end
    post path.admin_manufactory_edit do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      record = ManufactoryQuery.find(env.params.url["manufactory_id"])
      params = {
        name: env.params.body["manufactory[name]"].as(String)
      }

      SaveManufactory.update(record, **params) do |operation, manufactory|
        if operation.saved?
          env.redirect path.admin_company_for(company_id: company.id)
        else
          errors = operation.errors
          render_admin "admin/manufactories/edit.ecr"
        end
      end
    end

    # 删除
    get path.admin_manufactory_delete do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])

      Manufactory::DeleteOperation.delete!(manufactory)

      env.redirect path.admin_company_for(company_id: company.id)
    end
  end
end
