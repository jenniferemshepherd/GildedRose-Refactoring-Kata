require 'sulfuras'

describe 'Sulfuras' do
  it "does not decrease in quality" do
    item = Sulfuras.new(0, 80)
    item.update_item
    expect(item.quality).to eq 80
  end

  it "does not need to be sold" do
    item = Sulfuras.new(0, 80)
    item.update_item
    expect(item.sell_in).to eq 0
  end
end
