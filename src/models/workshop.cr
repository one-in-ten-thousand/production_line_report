class Workshop < BaseModel
  table do
    name : String
    column name : String
    belongs_to company : Company
    belongs_to manufactory : Manufactory
  end
end
