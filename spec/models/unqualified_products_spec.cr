require "../spec_helper"

describe "unqualified_products" do
  it "返回衣服所有不合格位置中的随机一个" do
    1000.times do
    ["Ling_Zi", "Xiu_Zi", "Qian_Pian"].should contain UnqualifiedProduct::Place.sample.to_s
    end
  end

  it "返回衣服所有不合格原因中的随机一个" do
    1000.times do
    ["Bu_Qi", "Qi_Mao", "Se_Cha", "Wai_Le"].should contain UnqualifiedProduct::Reason.sample.to_s
    end
  end
end
