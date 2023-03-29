module Admin::ManufactoryController
  macro included
    # 详情页
    get path.admin_manufactory do |env|
      company = CompanyQuery.find(env.params.url["company_id"])
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      workshops = ManufactoryQuery.preload_workshops(manufactory).workshops
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
        name:       env.params.body["manufactory[name]"].as(String),
        company_id: company.id,
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
        name: env.params.body["manufactory[name]"].as(String),
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
    post path.admin_manufactory_delete do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])

      Manufactory::DeleteOperation.delete!(manufactory)
    end
  end
end
