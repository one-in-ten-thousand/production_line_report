require "../spec_helper"

describe "unqualified_products" do
  it "返回衣服所有不合格位置中的随机一个" do
    1000.times do
      ["Ling_Zi", "Xiu_Zi", "Qian_Pian"].should contain UnqualifiedProduct::Place.values.sample.to_s
    end

    place = UnqualifiedProduct::Place.new(1)
    place.display_name.should eq "袖子"
  end

  it "返回衣服所有不合格原因中的随机一个" do
    1000.times do
      ["Bu_Qi", "Qi_Mao", "Se_Cha", "Wai_Le"].should contain UnqualifiedProduct::Reason.values.sample.to_s
    end
    reason = UnqualifiedProduct::Reason.new(1)
    reason.display_name.should eq "起毛"
  end
end
