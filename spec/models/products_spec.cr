require "../spec_helper"

describe "products" do
  it "返回衣服所有不合格位置中的随机一个" do
    1000.times do
      ["None", "Ling_Zi", "Xiu_Zi", "Qian_Pian"].should contain Product::Place.values.sample.to_s
    end

    place = Product::Place.new(1)
    place.display_name.should eq "领子"
  end

  it "返回衣服所有不合格原因中的随机一个" do
    1000.times do
      ["None", "Bu_Qi", "Qi_Mao", "Se_Cha", "Wai_Le"].should contain Product::Reason.values.sample.to_s
    end
    reason = Product::Reason.new(1)
    reason.display_name.should eq "不齐"

    reason1 = Product::Reason.new(:"se_cha")
    reason1.display_name.should eq "色差"
    reason2 = Product::Reason.from_value(2)
    reason2.display_name.should eq "起毛"
  end
end
