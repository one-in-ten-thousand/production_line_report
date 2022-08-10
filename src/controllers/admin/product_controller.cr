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

    post "/admin/process_lines/:process_line/products/new" do |env|
      json = env.params.json

      params = {

      }
      # process_line = ProcessLineQuery.new.find(json["line_id"])
      # line_id = json["line_id"]
      SaveProduct.create(**params) do |operation, product|
        if operation.saved?
          {msg: 'ok', code: '0000'}.to_json
        else
          errors = operation.errors
          {msg: errors.to_json, code: '1111'}
        end
      end
    end

    # 删除
    delete path.admin_product_delete do |env|
      product = ProductQuery.find(env.params.url["product_id"])

      Product::DeleteOperation.delete!(product)

      env.redirect path.admin_product_index
    end
  end
end
