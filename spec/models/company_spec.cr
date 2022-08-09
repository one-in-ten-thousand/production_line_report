require "../spec_helper"

describe Company do
  it "创建一个新的 Company" do
    company = CompanyFactory.create
    manufactory = ManufactoryFactory.create  do |e|
      e.company_id company.id
    end
    workshop = WorkshopFactory.create  do |e|
      e.company_id company.id
      e.manufactory_id manufactory.id
    end
    process_line = ProcessLineFactory.create  do |e|
      e.company_id company.id
      e.manufactory_id manufactory.id
      e.workshop_id workshop.id
    end
    report = ReportFactory.create do |e|
      e.company_id company.id
      e.manufactory_id manufactory.id
      e.workshop_id workshop.id
      e.process_line_id process_line.id
    end
    UnqualifiedProductFactory.create do |e|
      e.report_id report.id
    end
  end
end
