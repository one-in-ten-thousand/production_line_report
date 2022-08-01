class CompanyFactory < Avram::Factory
  def initialize
    name sequence("Company")
  end
end
