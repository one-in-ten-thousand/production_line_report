require "../../spec_helper"

describe "删除指定的 Report" do
  it "删除 Report" do
    _report1 = ReportFactory.create
    _report2 = ReportFactory.create
    report3 = ReportFactory.create

    ReportQuery.new.size.should eq 3

    post_json "/graphql", body: {
      query:     query,
      variables: {id: report3.id.to_s},
    }

    result = json_response.data.deleteReport
    result.code.should eq "0000"
    result.msg.should eq "ok"
    ReportQuery.new.size.should eq 2
  end
end
