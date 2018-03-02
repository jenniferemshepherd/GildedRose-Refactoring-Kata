require 'dexterity_vest'

describe DexterityVest do
  it "decreases in quality" do
    item = DexterityVest.new(10, 20)
    item.update
    expect(item.quality).to eq 19
  end

  it "decreases in quality twice as fast when sell_in<0" do
    item = DexterityVest.new(-1, 20)
    item.update
    expect(item.quality).to eq 18
  end

  it "decreases sell_in" do
    item = DexterityVest.new(10, 20)
    item.update
    expect(item.sell_in).to eq 9
  end
end
