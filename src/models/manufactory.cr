class Manufactory < BaseModel
  table do
    column name : String

    belongs_to company : Company

    has_many workshops : Workshop
  end
end
