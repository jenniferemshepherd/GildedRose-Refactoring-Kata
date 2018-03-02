require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context 'Sulfuras' do
      it "does not decrease in quality" do
        items = [Sulfuras.new(0, 80)]
        GildedRose.new(items).update_items()
        expect(items[0].quality).to eq 80
      end

      it "does not need to be sold" do
        items = [Sulfuras.new(0, 80)]
        GildedRose.new(items).update_items()
        expect(items[0].sell_in).to eq 0
      end
    end

    context 'Brie' do
      it "increases in quality" do
        items = [AgedBrie.new(2,0)]
        GildedRose.new(items).update_items()
        expect(items[0].quality).to eq 1
      end

      it "decreases sell_in" do
        items = [AgedBrie.new(2,0)]
        GildedRose.new(items).update_items()
        expect(items[0].sell_in).to eq 1
      end

      it "increases in quality twice as fast when sell_in < 0" do
        items = [AgedBrie.new(-1, 0)]
        GildedRose.new(items).update_items()
        expect(items[0].quality).to eq 2
      end
    end

    # context 'Conjured Mana Cake' do
    #   it "decreases in quality twice as fast" do
    #     items = [Item.new("Conjured Mana Cake", 3, 6)]
    #     GildedRose.new(items).update_quality()
    #     expect(items[0].quality).to eq 4
    #   end
    #
    #   it "decreases sell_in" do
    #     items = [Item.new("Conjured Mana Cake", 2, 0)]
    #     GildedRose.new(items).update_quality()
    #     expect(items[0].sell_in).to eq 2
    #   end
    # end

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it "cannot increase quality beyond 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end

      it "increases quality by 1 with >10 days to go" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 21
      end

      it "increases quality by 2 with 5<days<=10 to go" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 45)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 47
      end

      it "increases quality by 3 with 0<=days<=5 to go" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 45)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 48
      end

      it "has 0 quality when sell_in date is passed" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end

      it "decreases sell_in" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
      end
    end

    context '+5 Dexterity Vest' do
      it "decreases in quality" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 19
      end

      it "decreases in quality twice as fast when sell_in<0" do
        items = [Item.new("+5 Dexterity Vest", -1, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 18
      end

      it "decreases sell_in" do
        items = [Item.new("+5 Dexterity Vest", 10, 20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
      end
    end

    context 'Elixir of the Mongoose, 4, 6' do
      it "decreases in quality" do
        items = [Item.new("Elixir of the Mongoose", 4, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 5
      end

      it "decreases sell_in" do
        items = [Item.new("Elixir of the Mongoose", 4, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 3
      end

      it "decreases in quality twice as fast when sell_in<0" do
        items = [Item.new("Elixir of the Mongoose", -1, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
      end
    end
  end
end
