require "./spec_helper"

describe "上传 Post 数据" do
  it "上传数据成功" do
    path = RoutePath.new
    process_line = ProcessLineFactory.create
    workshop = process_line.workshop
    manufactory = workshop.manufactory
    company = manufactory.company

    url = path.admin_report_new_for(
      process_line_id: process_line.id,
      workshop_id: workshop.id,
      manufactory_id: manufactory.id,
      company_id: company.id
    )

    post_json url, body: {
                line_id: process_line.id,
                report_date: "2022-08-08",
              }
    response.body.should eq "<h1>Hello</h1>"
  end
end
