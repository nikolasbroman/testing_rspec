require "./lib/caesar_cipher.rb"

RSpec.describe do
  describe "#caesar_shift" do
    it "shifts lowercase letters" do
      expect(caesar_shift("a",1)).to eql("b")
    end
    it "shifts uppercase letters" do
      expect(caesar_shift("A",1)).to eql("B")
    end
    it "shifts from z to a" do
      expect(caesar_shift("z",1)).to eql("a")
    end
  end

  describe "#caesar_cipher" do
    it "encrypts a lowercase letter" do
      expect(caesar_cipher("c",2)).to eql("e")
    end
    it "encrypts an uppercase letter" do
      expect(caesar_cipher("Z",2)).to eql("B")
    end
    it "encrypts a string with only letters" do
      expect(caesar_cipher("abc",2)).to eql("cde")
    end
    it "encrypts a string with mixed cases" do
      expect(caesar_cipher("aBc",2)).to eql("cDe")
    end
    it "encrypts a string with spaces" do
      expect(caesar_cipher("Abc DEF",2)).to eql("Cde FGH")
    end
    it "encrypts a string with punctiation" do
      expect(caesar_cipher("ABC! Def, ghi... jk?",2)).to eql("CDE! Fgh, ijk... lm?")
    end
  end

end