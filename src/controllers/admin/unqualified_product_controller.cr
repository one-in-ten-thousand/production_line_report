module Admin::UnqualifiedProductController
  macro included
    # 列表页
    get path.admin_unqualified_product_index do |env|
      report = ReportQuery.find(env.params.url["report_id"])
      process_line = report.process_line
      workshop = process_line.workshop
      manufactory = workshop.manufactory
      company = manufactory.company
      unqualified_products = report.unqualified_products

      render_admin "admin/unqualified_products/index.ecr"
    end

    # 删除
    delete path.admin_unqualified_product_delete do |env|
      unqualified_product = UnqualifiedProductQuery.find(env.params.url["unqualified_product_id"])

      UnqualifiedProduct::DeleteOperation.delete!(unqualified_product)

      env.redirect path.admin_unqualified_product_index
    end
  end
end
