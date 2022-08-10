class WorkshopFactory < Avram::Factory
  def initialize
    name sequence("车间")

    before_save do
      if operation.manufactory_id.value.nil?
        manufactory = ManufactoryFactory.create

        manufactory_id manufactory.id
        company_id manufactory.company.id
      end
    end
  end
end
