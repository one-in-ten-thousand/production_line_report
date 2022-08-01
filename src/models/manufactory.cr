class Manufactory < BaseModel
  table do
    column name : String
    belongs_to company : Company
  end
end
