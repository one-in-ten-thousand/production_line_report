class ProcessLine < BaseModel
  table do
    column name : String

    belongs_to company : Company
    belongs_to manufactory : Manufactory
    belongs_to workshop : Workshop

    has_many reports : Report
    has_many products : Product
  end
end
