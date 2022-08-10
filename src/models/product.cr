class Product < BaseModel
  enum Place
    None
    Ling_Zi
    Xiu_Zi
    Qian_Pian

    def display_name
      {
        None:      "无",
        Ling_Zi:   "领子",
        Xiu_Zi:    "袖子",
        Qian_Pian: "前片",
      }[self.to_s]
    end
  end

  enum Reason
    None
    Bu_Qi
    Qi_Mao
    Se_Cha
    Wai_Le

    def display_name
      {
        None:   "无",
        Bu_Qi:  "不齐",
        Qi_Mao: "起毛",
        Se_Cha: "色差",
        Wai_Le: "歪了",
      }[self.to_s]
    end
  end

  table do
    column name : String
    column place : Product::Place
    column reason : Product::Reason
    column report_date : String
    belongs_to process_line : ProcessLine
    belongs_to workshop : Workshop
    belongs_to manufactory : Manufactory
    belongs_to company : Company
  end
end
