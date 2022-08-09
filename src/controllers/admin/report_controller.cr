module Admin::ReportController
  macro included
    post path.admin_report_new do |env|
      json = env.params.json
      # params = {
      #   name: env.params.body["report[name]"].as(String)
      # }

      # SaveReport.create(**params) do |operation, report|
      #   if operation.saved?
      #     env.redirect path.admin_report_index
      #   else
      #     errors = operation.errors
      #     render_layout "admin/reports/new.ecr"
      #   end
      # end
      "<h1>Hello</h1>"
    end

    # 删除
    delete path.admin_report_delete do |env|
      report = ReportQuery.find(env.params.url["report_id"])

      Report::DeleteOperation.delete!(report)
    end
  end
end
