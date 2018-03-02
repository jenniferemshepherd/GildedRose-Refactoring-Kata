require 'gilded_rose'
require 'item'
require 'aged_brie'
require 'backstage_pass'
require 'conjured'
require 'dexterity_vest'
require 'elixir'
require 'sulfuras'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "behaves as predicted" do
      items = [Sulfuras.new(0, 80),
              AgedBrie.new(2,0),
              AgedBrie.new(-1, 0),
              BackstagePass.new(2, 49),
              BackstagePass.new(15, 20),
              BackstagePass.new(10, 45),
              BackstagePass.new(5, 45),
              BackstagePass.new(0, 49),
              DexterityVest.new(10, 20),
              DexterityVest.new(-1, 20),
              Elixir.new(4, 6),
              Elixir.new(-1, 6),
              Conjured.new(3, 6),
              Conjured.new(2, 0)]
      GildedRose.new(items).update
      expect(items[0].quality).to eq 80
      expect(items[0].sell_in).to eq 0
      expect(items[1].quality).to eq 1
      expect(items[1].sell_in).to eq 1
      expect(items[2].quality).to eq 2
      expect(items[3].quality).to eq 50
      expect(items[3].sell_in).to eq 1
      expect(items[4].quality).to eq 21
      expect(items[5].quality).to eq 47
      expect(items[6].quality).to eq 48
      expect(items[7].quality).to eq 0
      expect(items[8].quality).to eq 19
      expect(items[8].sell_in).to eq 9
      expect(items[9].quality).to eq 18
      expect(items[10].quality).to eq 5
      expect(items[10].sell_in).to eq 3
      expect(items[11].quality).to eq 4
      expect(items[12].sell_in).to eq 2
    end
  end
end
