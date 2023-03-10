class ProcessLineFactory < Avram::Factory
  def initialize
    name sequence("生产线")

    before_save do
      id = operation.workshop_id.value

      if id.nil?
        workshop = WorkshopFactory.create
      else
        workshop = WorkshopQuery.new.find(id)
      end

      workshop_id workshop.id
      manufactory_id workshop.manufactory_id
      company_id workshop.company_id
    end
  end
end
