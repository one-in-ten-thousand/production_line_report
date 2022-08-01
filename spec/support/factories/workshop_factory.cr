class WorkshopFactory < Avram::Factory
  def initialize
    name sequence("Workshop")
  end
end
