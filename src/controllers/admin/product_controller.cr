module Admin::ProductController
  macro included
    # 列表页
    get path.admin_product_index do |env|
      report = ReportQuery.find(env.params.url["report_id"])
      process_line = report.process_line
      workshop = process_line.workshop
      manufactory = workshop.manufactory
      company = manufactory.company
      products = report.products

      render_admin "admin/products/index.ecr"
    end

    # 删除
    delete path.admin_product_delete do |env|
      product = ProductQuery.find(env.params.url["product_id"])

      Product::DeleteOperation.delete!(product)

      env.redirect path.admin_product_index
    end
  end
end
