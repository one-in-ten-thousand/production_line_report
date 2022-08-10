class CompanyFactory < Avram::Factory
  def initialize
    name sequence("公司")
  end
end
