require "../../../spec/support/factories/**"

# Add sample data helpful for development, e.g. (fake users, blog posts, etc.)
#
# Use `Db::Seed::RequiredData` if you need to create data *required* for your
# app to work.
class Db::Seed::SampleData < LuckyTask::Task
  summary "Add sample database records helpful for development"

  def call
    Signal::INT.trap do
      print_exit("\n按下 Ctrl C")
    end

    print "重置所有公司、工厂、车间、生产线数据？（y/yes 继续）"
    input = gets.try &.rstrip

    print_exit("拒绝执行") unless ["y", "yes"].includes? input.to_s.downcase

    CompanyQuery.truncate(cascade: true)

    companies = Array.new(3) { CompanyFactory.create }

    manufactories = companies.map do |company|
      Array.new(rand(2..5)) do
        ManufactoryFactory.create &.company_id(company.id)
      end
    end.flatten

    workshops = manufactories.map do |manufactory|
      Array.new(rand(2..5)) do
        WorkshopFactory.create &.company_id(manufactory.company_id)
          .manufactory_id(manufactory.id)
      end
    end.flatten

    process_lines = workshops.map do |workshop|
      Array.new(rand(2..5)) do
        ProcessLineFactory.create &.company_id(workshop.company_id)
          .manufactory_id(workshop.manufactory_id)
          .workshop_id(workshop.id)
      end
    end.flatten

    reports = process_lines.map do |process_line|
      Array.new(rand(2..5)) do
        ReportFactory.create &.company_id(process_line.company_id)
          .manufactory_id(process_line.manufactory_id)
          .workshop_id(process_line.workshop_id)
          .process_line_id(process_line.id)
      end
    end.flatten

    products = reports.map do |report|
      Array.new(rand(5..10)) do
        ProductFactory.create &.report_id(report.id)
      end
    end

    puts "Done adding sample data"
  end

  def print_exit(reason)
    puts reason
    puts "退出 ..."
    exit
  end
end
