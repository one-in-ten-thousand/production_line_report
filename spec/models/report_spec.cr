require "../spec_helper"

describe Company do
  it "成功创建一个新的 Report" do
    # company = CompanyFactory.create
    CompanyQuery.new.size.should eq 0
    ManufactoryQuery.new.size.should eq 0
    WorkshopQuery.new.size.should eq 0
    ProcessLineQuery.new.size.should eq 0
    ReportQuery.new.size.should eq 0

    report = ReportFactory.create

    CompanyQuery.new.size.should eq 1
    ManufactoryQuery.new.size.should eq 1
    WorkshopQuery.new.size.should eq 1
    ProcessLineQuery.new.size.should eq 1
    ReportQuery.new.size.should eq 1
  end
end
