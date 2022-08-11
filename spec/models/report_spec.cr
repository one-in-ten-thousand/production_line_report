require "../spec_helper"

describe Company do
  it "成功创建一个新的生产线" do
    CompanyQuery.new.size.should eq 0
    ManufactoryQuery.new.size.should eq 0
    WorkshopQuery.new.size.should eq 0
    ProcessLineQuery.new.size.should eq 0

    process_line = ProcessLineFactory.create

    CompanyQuery.new.size.should eq 1
    ManufactoryQuery.new.size.should eq 1
    WorkshopQuery.new.size.should eq 1
    ProcessLineQuery.new.size.should eq 1
  end

  it "成功创建一个新的生产线1" do
    company = CompanyFactory.create

    manufactory = ManufactoryFactory.create &.company_id(company.id)

    CompanyQuery.new.size.should eq 1

    workshop = WorkshopFactory.create &.manufactory_id(manufactory.id)

    CompanyQuery.new.size.should eq 1
    ManufactoryQuery.new.size.should eq 1

    process_line = ProcessLineFactory.create &.workshop_id(workshop.id)

    CompanyQuery.new.size.should eq 1
    ManufactoryQuery.new.size.should eq 1
    WorkshopQuery.new.size.should eq 1
  end
end
