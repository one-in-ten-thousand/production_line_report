# curl \
#   -X POST \
#   -H "Content-Type: application/json" \
#   --data '{ "query": "{ hello(name: \"John Doe\") }" }' \
#   http://0.0.0.0:3000/graphql

module GraphqlController
  macro included
    get "/graphiql" do |env|
      render "src/views/graphiql.ecr"
    end

    post "/graphql" do |env|
      env.response.content_type = "application/json"

      query = env.params.json["query"].as(String)
      variables = env.params.json["variables"]?.as(Hash(String, JSON::Any)?)
      operation_name = env.params.json["operationName"]?.as(String?)

      schema = GraphQL::Schema.new(Query.new)

      # puts schema.document.to_s

      schema.execute(query, variables, operation_name)
    end
  end
end
