require 'backstage_pass'

describe BackstagePass do
  describe "#update_quality" do
    it "cannot increase quality beyond 50" do
      item = BackstagePass.new(2, 49)
      item.update
      expect(item.quality).to eq 50
    end

    it "increases quality by 1 with >10 days to go" do
      item = BackstagePass.new(15, 20)
      item.update
      expect(item.quality).to eq 21
    end

    it "increases quality by 2 with 5<days<=10 to go" do
      item = BackstagePass.new(10, 45)
      item.update
      expect(item.quality).to eq 47
    end

    it "increases quality by 3 with 0<=days<=5 to go" do
      item = BackstagePass.new(5, 45)
      item.update
      expect(item.quality).to eq 48
    end

    it "has 0 quality when sell_in date is passed" do
      item = BackstagePass.new(0, 49)
      item.update
      expect(item.quality).to eq 0
    end

    it "decreases sell_in" do
      item = BackstagePass.new(5, 49)
      item.update
      expect(item.sell_in).to eq 4
    end
  end
end
