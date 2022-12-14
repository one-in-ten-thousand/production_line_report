module Types
  @[GraphQL::Object]
  class ProductQueryType < GraphQL::BaseObject
    @[GraphQL::Field]
    def target : TargetType
      report = ReportQuery.new.first

      TargetType.new(
        target_total_count: report.target_total_count,
        processed_total_count: report.processed_total_count,
      )
    end
  end
end
