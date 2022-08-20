module Types
  @[GraphQL::Object]
  class MutationType < GraphQL::BaseMutation
    @[GraphQL::Field]
    def delete_report(id : String) : MutationResponseType
      report = ReportQuery.new.find(id)

      Report::DeleteOperation.delete!(report)

      MutationResponseType.new(code: "0000", msg: "ok")
    end
  end
end
