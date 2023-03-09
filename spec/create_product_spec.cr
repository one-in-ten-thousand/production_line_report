require "./spec_helper"

describe "上传产品数据" do
  it "上传数据成功" do
    process_line = ProcessLineFactory.create
    workshop = process_line.workshop
    manufactory = workshop.manufactory
    manufactory.company

    ProductQuery.new.size.should eq 0

    post_json "/admin/process_lines/#{process_line.id}/products/new",
      body: {
        name:            "衬衣",
        process_line_id: process_line.id,
        report_date:     "2022-08-08",
        place:           2,
        reason:          2,
      }

    json_response.should eq({"msg" => "ok", "code" => "0000"})
    ProductQuery.new.size.should eq 1
  end
end
