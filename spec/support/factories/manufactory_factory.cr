class ManufactoryFactory < Avram::Factory
  def initialize
    name sequence("Manufactory")
  end
end
