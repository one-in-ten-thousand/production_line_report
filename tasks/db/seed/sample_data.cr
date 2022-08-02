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
        ManufactoryFactory.create do |e|
          e.company_id company.id
        end
      end
    end.flatten

    workshops = manufactories.map do |manufactory|
      Array.new(rand(2..5)) do
        WorkshopFactory.create do |e|
          e.company_id manufactory.company.id
          e.manufactory_id manufactory.id
        end
      end
    end.flatten

    workshops.map do |workshop|
      Array.new(rand(2..5)) do
        ProcessLineFactory.create do |e|
          e.company_id workshop.manufactory.company.id
          e.manufactory_id workshop.manufactory.id
          e.workshop_id workshop.id
        end
      end
    end.flatten

    puts "Done adding sample data"
  end

  def print_exit(reason)
    puts reason
    puts "退出 ..."
    exit
  end
end
