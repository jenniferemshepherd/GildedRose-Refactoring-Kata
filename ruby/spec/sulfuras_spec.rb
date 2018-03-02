require 'sulfuras'

describe 'Sulfuras' do
  it "quality does not change" do
    item = Sulfuras.new(0,80)
    item.update_quality()
    expect(item.quality).to eq 80
  end

  it "sell_in does not change" do
    item = Sulfuras.new(-1,80)
    item.update_sell_in()
    expect(item.sell_in).to eq -1
  end

end
