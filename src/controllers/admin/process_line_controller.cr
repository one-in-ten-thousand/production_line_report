module Admin::ProcessLineController
  macro included
    # 列表页
    set_variable = ->(env : HTTP::Server::Context) do
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = WorkshopQuery.preload_manufactory(workshop).manufactory
      company = ManufactoryQuery.preload_company(manufactory).company
      {company, manufactory, workshop}
    end

    get path.admin_process_line_index do |env|
      company, manufactory, workshop = set_variable.call(env)
      process_lines = ProcessLineQuery.new.workshop_id(workshop.id)
      render_admin "admin/process_lines/index.ecr"
    end

    # 详情页
    get path.admin_process_line do |env|
      company, manufactory, workshop = set_variable.call(env)
      process_line = ProcessLineQuery.find(env.params.url["process_line_id"])
      reports = ReportQuery.new.process_line_id(process_line.id)
      render_admin "admin/process_lines/show.ecr"
    end

    # 新记录
    get path.admin_process_line_new do |env|
      company, manufactory, workshop = set_variable.call(env)
      operation = SaveProcessLine.new
      errors = {} of Symbol => Array(String)

      render_admin "admin/process_lines/new.ecr"
    end
    post path.admin_process_line_new do |env|
      company, manufactory, workshop = set_variable.call(env)
      params = {
        name:           env.params.body["process_line[name]"].as(String),
        company_id:     company.id,
        manufactory_id: manufactory.id,
        workshop_id:    workshop.id,
      }

      SaveProcessLine.create(**params) do |operation, process_line|
        if operation.saved?
          env.redirect path.admin_workshop_for(company_id: company.id, manufactory_id: manufactory.id, workshop_id: workshop.id)
        else
          errors = operation.errors
          render_admin "admin/process_lines/new.ecr"
        end
      end
    end

    # 编辑
    get path.admin_process_line_edit do |env|
      company, manufactory, workshop = set_variable.call(env)
      operation = SaveProcessLine.new(ProcessLineQuery.find(env.params.url["process_line_id"]))
      errors = {} of Symbol => Array(String)

      render_admin "admin/process_lines/edit.ecr"
    end
    post path.admin_process_line_edit do |env|
      company, manufactory, workshop = set_variable.call(env)
      record = ProcessLineQuery.find(env.params.url["process_line_id"])
      params = {
        name: env.params.body["process_line[name]"].as(String),
      }

      SaveProcessLine.update(record, **params) do |operation, process_line|
        if operation.saved?
          env.redirect path.admin_workshop_for(company_id: company.id, manufactory_id: manufactory.id, workshop_id: workshop.id)
        else
          errors = operation.errors
          render_admin "admin/process_lines/edit.ecr"
        end
      end
    end

    # 删除
    post path.admin_process_line_delete do |env|
      process_line = ProcessLineQuery.find(env.params.url["process_line_id"])

      ProcessLine::DeleteOperation.delete!(process_line)
    end
  end
end
