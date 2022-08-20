@[GraphQL::InputObject]
class ReportInput < GraphQL::BaseInputObject
  getter id : String

  @[GraphQL::Field]
  def initialize(@id : String)
  end
end
