class ManufactoryFactory < Avram::Factory
  def initialize
    name sequence("工厂")

    before_save do
      if operation.company_id.value.nil?
        company_id CompanyFactory.create.id
      end
    end
  end
end
