class UnqualifiedProduct < BaseModel
  enum Place
    Ling_Zi
    Xiu_Zi
    Qian_Pian

    def display_name
      {
        Ling_Zi:   "领子",
        Xiu_Zi:    "袖子",
        Qian_Pian: "前片",
      }[self.to_s]
    end
  end

  enum Reason
    Bu_Qi
    Qi_Mao
    Se_Cha
    Wai_Le

    def display_name
      {
        Bu_Qi:  "不齐",
        Qi_Mao: "起毛",
        Se_Cha: "色差",
        Wai_Le: "歪了",
      }[self.to_s]
    end
  end

  table do
    column name : String
    column place : UnqualifiedProduct::Place
    column reason : UnqualifiedProduct::Reason
    belongs_to report : Report
  end
end
