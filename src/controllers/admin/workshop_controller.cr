module Admin::WorkshopController
  macro included
    # 列表页
    get path.admin_workshop_index do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      workshops = WorkshopQuery.new
      company = manufactory.company
      render_admin "admin/workshops/index.ecr"
    end

    # 详情页
    get path.admin_workshop do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      process_lines = workshop.process_lines
      render_admin "admin/workshops/show.ecr"
    end

    # 新记录
    get path.admin_workshop_new do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      operation = SaveWorkshop.new
      errors = {} of Symbol => Array(String)

      render_admin "admin/workshops/new.ecr"
    end
    post path.admin_workshop_new do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      params = {
        name: env.params.body["workshop[name]"].as(String),
        company_id: company.id,
        manufactory_id: manufactory.id,
      }

      SaveWorkshop.create(**params) do |operation, workshop|
        if operation.saved?
          env.redirect path.admin_manufactory_for(manufactory_id: manufactory.id, company_id: company.id)
        else
          errors = operation.errors
          render_admin "admin/workshops/new.ecr"
        end
      end
    end

    # 编辑
    get path.admin_workshop_edit do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      operation = SaveWorkshop.new(WorkshopQuery.find(env.params.url["workshop_id"]))
      errors = {} of Symbol => Array(String)

      render_admin "admin/workshops/edit.ecr"
    end
    post path.admin_workshop_edit do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      record = WorkshopQuery.find(env.params.url["workshop_id"])
      params = {
        name: env.params.body["workshop[name]"].as(String)
      }

      SaveWorkshop.update(record, **params) do |operation, workshop|
        if operation.saved?
          env.redirect path.admin_manufactory_for(manufactory_id: manufactory.id, company_id: company.id)
        else
          errors = operation.errors
          render_admin "admin/workshops/edit.ecr"
        end
      end
    end

    # 删除
    get path.admin_workshop_delete do |env|
      manufactory = ManufactoryQuery.find(env.params.url["manufactory_id"])
      company = manufactory.company
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])

      Workshop::DeleteOperation.delete!(workshop)

      env.redirect path.admin_manufactory_for(manufactory_id: manufactory.id, company_id: company.id)
    end
  end
end
