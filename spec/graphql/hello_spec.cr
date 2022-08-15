require "../spec_helper"

describe "test graphql is ok" do
  it "test hello type" do
    post_json "/graphql", body: {
      query: query,
    }
    json_body.should eq(
      {
        "data" => {
          "hello" => "Hello, Billy!",
        },
      }
    )
  end
end
