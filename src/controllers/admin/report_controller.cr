module Admin::ReportController
  macro included
    # 删除
    delete path.admin_report_delete do |env|
      report = ReportQuery.find(env.params.url["report_id"])

      Report::DeleteOperation.delete!(report)
    end
  end
end
