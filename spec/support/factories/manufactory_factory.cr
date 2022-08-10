class ManufactoryFactory < Avram::Factory
  def initialize
    name sequence("工厂")

    before_save do
      id = operation.company_id.value

      if id.nil?
        company = CompanyFactory.create
      else
        company = CompanyQuery.new.find(id)
      end

      company_id company.id
    end
  end
end
