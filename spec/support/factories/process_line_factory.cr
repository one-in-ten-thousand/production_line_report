class ProcessLineFactory < Avram::Factory
  def initialize
    name sequence("生产线")

    before_save do
      if operation.workshop_id.value.nil?
        workshop = WorkshopFactory.create

        workshop_id workshop.id
        manufactory_id workshop.manufactory.id
        company_id workshop.manufactory.company.id
      end
    end
  end
end
