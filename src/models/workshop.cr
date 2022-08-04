class Workshop < BaseModel
  table do
    name : String
    column name : String

    belongs_to company : Company
    belongs_to manufactory : Manufactory

    has_many process_lines : ProcessLine
  end
end
