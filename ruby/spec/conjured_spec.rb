require 'conjured'

describe 'conjured' do
  it "decreases in quality twice as fast" do
    item = Conjured.new(3, 6)
    item.update
    expect(item.quality).to eq 4
  end

  it "decreases sell_in" do
    item = Conjured.new(2, 0)
    item.update
    expect(item.sell_in).to eq 1
  end
end
