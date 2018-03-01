require 'aged_brie'

describe 'AgedBrie' do
  it "increases in quality" do
    item = AgedBrie.new(2,0)
    item.update_quality()
    expect(item.quality).to eq 1
  end

  it "decreases sell_in" do
    item = AgedBrie.new(2,0)
    item.update_sell_in()
    expect(item.sell_in).to eq 1
  end

  it "increases in quality twice as fast when sell_in < 0" do
    item = AgedBrie.new(-1, 0)
    item.update_quality()
    expect(item.quality).to eq 2
  end
end
