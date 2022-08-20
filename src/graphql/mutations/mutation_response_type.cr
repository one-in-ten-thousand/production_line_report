module Types
  @[GraphQL::Object]
  class MutationResponseType < GraphQL::BaseObject
    @[GraphQL::Field]
    property code : String

    @[GraphQL::Field]
    property msg : String

    def initialize(@code, @msg)
    end
  end
end
