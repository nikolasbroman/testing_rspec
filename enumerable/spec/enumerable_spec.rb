require "./lib/enumerable.rb"

RSpec.describe do
  describe "#my_each" do
    it "iterates through array.length times" do
      result = 0
      [1,2,3].my_each { result += 1 }
      expect(result).to eql(3)
    end
    it "can extract value during each iteration" do
      result = 0
      [1,2,3].my_each { |n| result += n }
      expect(result).to eql(6)
    end
  end

  describe "#my_each_with_index" do
    it "can extract value & index during each iteration" do
      result = 0
      [1,2,3].my_each_with_index { |n, i| result += (n * i) }
      expect(result).to eql(8)
    end
  end

  describe "#my_select" do
    it "selects correct values" do
      result = [1,2,3,4,5].my_select { |n| n % 2 == 0}
      expect(result).to eql([2,4])
    end
  end

  describe "#my_all?" do
    it "returns true if all are true" do
      result = [1,3,5].my_all? { |n| n % 2 == 1}
      expect(result).to eql(true)
    end

    it "returns false if any are false" do
      result = [1,3,10].my_all? { |n| n % 2 == 1}
      expect(result).to eql(false)
    end
  end

  describe "#my_any?" do
    it "returns true if one is true" do
      result = [1,3,5,10].my_any? { |n| n % 2 == 0}
      expect(result).to eql(true)
    end

    it "returns false if all are false" do
      result = [1,3,5].my_any? { |n| n % 2 == 0}
      expect(result).to eql(false)
    end
  end

  describe "#my_none?" do
    it "returns true if none is true" do
      result = [1,3,5].my_none? { |n| n % 2 == 0}
      expect(result).to eql(true)
    end

    it "returns false if one is true" do
      result = [1,3,5,10].my_none? { |n| n % 2 == 0}
      expect(result).to eql(false)
    end
  end

  describe "#my_count" do
    it "counts all items" do
      result = [1,3,5,10].my_count
      expect(result).to eql(4)
    end
    it "counts all items that match condition" do
      result = [1,3,5,10].my_count { |n| n % 2 == 1}
      expect(result).to eql(3)
    end
  end

  describe "#my_map" do
    it "returns the same array if given block without modifications" do
      ary = [1, true, "string", nil]
      result = ary.my_map { |x| x }
      expect(result).to eql(ary)
    end

    it "modifies all values according to block" do
      ary = [2, 5, "string"]
      result = ary.my_map { |x| x * 2 }
      expect(result).to eql([4, 10, "stringstring"])
    end
  end

  describe "#my_inject" do
    it "sums numbers" do
      result = [5,6,7].my_inject { |sum, n| sum + n }
      expect(result).to eql(18)
    end
    it "accepts an initial value" do
      result = [5,6,7].my_inject(10) { |sum, n| sum + n }
      expect(result).to eql(28)
    end
  end

end