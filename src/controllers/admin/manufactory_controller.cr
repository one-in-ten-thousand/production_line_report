module Admin::ManufactoryController
  macro included
    # 列表页
    get path.admin_manufactory_index do |env|
      manufactories = ManufactoryQuery.new
      render_admin "admin/manufactories/index.ecr"
    end

    # 详情页
    get path.admin_manufactory do |env|
      manufactory = ManufactoryQuery.find(env.params.url["id"])
      render_admin "admin/manufactories/show.ecr"
    end

    # 新记录
    get path.admin_manufactory_new do |env|
      errors = {} of Symbol => Array(String)

      render_admin "admin/manufactories/new.ecr"
    end
    post path.admin_manufactory_new do |env|
      params = {
        name: env.params.body["manufactory[name]"].as(String)
      }

      SaveManufactory.create(**params) do |operation, manufactory|
        if operation.saved?
          env.redirect path.admin_manufactory_index
        else
          errors = operation.errors
          render_admin "admin/manufactories/new.ecr"
        end
      end
    end

    # 编辑
    get path.admin_manufactory_edit do |env|
      errors = {} of Symbol => Array(String)

      manufactory = ManufactoryQuery.find(env.params.url["id"])

      render_admin "admin/manufactories/edit.ecr"
    end
    post path.admin_manufactory_edit do |env|
      manufactory = ManufactoryQuery.find(env.params.url["id"])
      params = {
        name: env.params.body["manufactory[name]"].as(String)
      }

      SaveManufactory.update(manufactory, **params) do |operation, manufactory|
        if operation.saved?
          env.redirect path.admin_manufactory_index
        else
          errors = operation.errors
          render_admin "admin/manufactories/edit.ecr"
        end
      end
    end

    # 删除
    get path.admin_manufactory_delete do |env|
      manufactory = ManufactoryQuery.find(env.params.url["id"])

      Manufactory::DeleteOperation.delete!(manufactory)

      env.redirect path.admin_manufactory_index
    end
  end
end
