class UnqualifedProduct < BaseModel
  enum Place
    LingZi
    XiuZi
    QianPian
  end

  enum Reason
    BuQi
    QiMao
    SeCha
    WaiLe
  end

  table do
    column place : UnqualifedProduct::Place
    column reason : UnqualifedProduct::Reason
    belongs_to report : Report
  end
end
