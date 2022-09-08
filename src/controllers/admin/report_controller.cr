module Admin::ReportController
  macro included
    # 生成报告
    post "/admin/process_lines/:process_line_id/create_reports" do |env|
      process_line_id = env.params.url["process_line_id"].to_i64

      process_line = ProcessLineQuery.new.find(process_line_id)
      workshop = process_line.workshop
      manufactory = workshop.manufactory
      company = manufactory.company
      process_line
        .products
        .group_by { |product| product.report_date }
        .each do |report_date, products|
          SaveReport.upsert!(
            report_date: report_date,
            process_line_id: process_line_id,
            target_total_count: 50,
            processed_total_count: products.size,
            qualified_total_count: products.count { |e| e.place.value + e.reason.value == 0 },
          )
        end
    end

    # 删除
    post path.admin_report_delete do |env|
      report = ReportQuery.find(env.params.url["report_id"])

      Report::DeleteOperation.delete!(report)
    end
  end
end
