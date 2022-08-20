module Types
  class ProductQueryType
    @[GraphQL::Object]
    class TargetType < GraphQL::BaseObject
      def initialize(
        @target_total_count : Int32,
        @processed_total_count : Int32
      )
      end

      # 这个 TargetType 只有两个字段
      @[GraphQL::Field]
      getter target_total_count : Int32
      @[GraphQL::Field]
      getter processed_total_count : Int32
    end
  end
end
