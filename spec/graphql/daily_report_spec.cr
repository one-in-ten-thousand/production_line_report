require "../spec_helper"

describe "daily reports" do
  it "test daily report query" do
    report = ReportFactory.create

    post_json "/graphql", body: {query: query}

    target = json_response.data.reportQuery.target

    target.targetTotalCount.should eq report.target_total_count
    target.processedTotalCount.should eq report.processed_total_count
    target.qualifiedTotalCount.should eq report.qualified_total_count
  end
end
