class UnqualifiedProduct < BaseModel
  enum Place
    Ling_Zi
    Xiu_Zi
    Qian_Pian
  end

  enum Reason
    Bu_Qi
    Qi_Mao
    Se_Cha
    Wai_Le
  end

  table do
    column name : String
    column place : UnqualifiedProduct::Place
    column reason : UnqualifiedProduct::Reason
    belongs_to report : Report
  end
end
