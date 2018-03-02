require 'elixir'

describe Elixir do
  it "decreases in quality" do
    item = Elixir.new(4, 6)
    item.update_item
    expect(item.quality).to eq 5
  end

  it "decreases sell_in" do
    item = Elixir.new(4, 6)
    item.update_item
    expect(item.sell_in).to eq 3
  end

  it "decreases in quality twice as fast when sell_in<0" do
    item = Elixir.new(-1, 6)
    item.update_item
    expect(item.quality).to eq 4
  end
end
