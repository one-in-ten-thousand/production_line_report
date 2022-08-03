class Company < BaseModel
  table do
    column name : String
    has_many manufactories : Manufactory
  end
end
