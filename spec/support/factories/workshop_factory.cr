class WorkshopFactory < Avram::Factory
  def initialize
    name sequence("车间")

    before_save do
      id = operation.manufactory_id.value

      if id.nil?
        manufactory = ManufactoryFactory.create
      else
        manufactory = ManufactoryQuery.new.find(id)
      end

      manufactory_id manufactory.id
      company_id manufactory.company.id
    end
  end
end
