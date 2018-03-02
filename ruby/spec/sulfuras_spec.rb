require 'sulfuras'

describe 'Sulfuras' do
  it "does not decrease in quality" do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 80
  end

  it "does not need to be sold" do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq 0
  end
end
