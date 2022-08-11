module Admin::ProductController
  macro included
    post "/admin/process_lines/:process_line_id/products/new" do |env|
      env.response.content_type = "application/json"
      json = env.params.json

      params = {
        name: json["name"].as(String),
        process_line_id: json["process_line_id"].as(Int64),
        report_date: json["report_date"].as(String),
        place: Product::Place.from_value(json["place"].as(Int64)),
        reason: Product::Reason.from_value(json["reason"].as(Int64))
      }

      SaveProduct.create(**params) do |operation, product|
        if operation.saved?
          {msg: "ok", code: "0000"}.to_json
        else
          {msg: operation.errors, code: "1111"}.to_json
        end
      end
    end

    # 删除
    post path.admin_product_delete do |env|
      product = ProductQuery.find(env.params.url["product_id"])

      Product::DeleteOperation.delete!(product)
    end
  end
end
