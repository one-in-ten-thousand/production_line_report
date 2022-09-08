module Admin::ProcessLineController
  macro included
    # 列表页
    get path.admin_process_line_index do |env|
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
      process_lines = ProcessLineQuery.new
      render_admin "admin/process_lines/index.ecr"
    end

    # 详情页
    get path.admin_process_line do |env|
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
      process_line = ProcessLineQuery.find(env.params.url["process_line_id"])
      reports = ReportQuery.new.process_line_id(process_line.id)
      render_admin "admin/process_lines/show.ecr"
    end

    # 新记录
    get path.admin_process_line_new do |env|
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
      operation = SaveProcessLine.new
      errors = {} of Symbol => Array(String)

      render_admin "admin/process_lines/new.ecr"
    end
    post path.admin_process_line_new do |env|
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
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
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
      operation = SaveProcessLine.new(ProcessLineQuery.find(env.params.url["process_line_id"]))
      errors = {} of Symbol => Array(String)

      render_admin "admin/process_lines/edit.ecr"
    end
    post path.admin_process_line_edit do |env|
      workshop = WorkshopQuery.find(env.params.url["workshop_id"])
      manufactory = workshop.manufactory
      company = manufactory.company
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
