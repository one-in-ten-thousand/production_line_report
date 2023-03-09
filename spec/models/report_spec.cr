require "../spec_helper"

describe Company do
  it "成功创建一个新的生产线" do
    CompanyQuery.new.size.should eq 0
    ManufactoryQuery.new.size.should eq 0
    WorkshopQuery.new.size.should eq 0
    ProcessLineQuery.new.size.should eq 0

    ProcessLineFactory.create

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

    ProcessLineFactory.create &.workshop_id(workshop.id)

    CompanyQuery.new.size.should eq 1
    ManufactoryQuery.new.size.should eq 1
    WorkshopQuery.new.size.should eq 1
  end

  it "覆盖 created_at" do
    company = CompanyFactory.create
    company.created_at.should_not be_nil

    company1 = CompanyFactory.create &.created_at Time.parse_local("2022-08-14 22:10:10", "%F %T")
    company1.created_at.should eq Time.parse_local("2022-08-14 22:10:10", "%F %T")
  end
end
