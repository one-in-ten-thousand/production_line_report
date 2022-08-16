module Types
  @[GraphQL::Object]
  class MutationType < GraphQL::BaseMutation
    @[GraphQL::Field]
    def echo(str : String) : String
      str
    end
  end
end
