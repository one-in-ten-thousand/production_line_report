module Types
  @[GraphQL::Object]
  class QueryType < GraphQL::BaseQuery
    @[GraphQL::Field]
    def hello(name : String) : String
      "Hello, #{name}!"
    end

    @[GraphQL::Field]
    def report_query : ReportQueryType
      ReportQueryType.new
    end
  end
end
