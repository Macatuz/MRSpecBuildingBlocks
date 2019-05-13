require_relative "../lib/enum"

RSpec.describe Enumerable do
  context "my_count" do
    it "Invokes the given block once for each element of self, replacing the element with the value returned by the block." do
      arr = [1, 2, 3, 4, 5, 6, 7]
      ans = arr.my_count?
      expect(ans).to eq 7
    end
  end

  context "my_all " do
    it "Return true if all elements are true or empty array" do
      test = [1, 2, 3, 4]
      ans = test.my_all? { |i| i == 2 }
      expect(ans).to eq false
    end
  end

  context "my_none " do
    it "Returns true if none of the elements match the given block" do
      test = [1, 2, 3, 4]
      ans = test.my_none? { |i| i == 5 }
      expect(ans).to eq true
    end
  end

  context "my_each " do
    it "Should Iterate over inner items calling passed block" do
      test = [1, 2, 3, 4]
      ans = 0
      test.my_each { |i| ans += i }
      expect(ans).to eq 10
    end
  end

  context "my_each_with_index " do
    it "Should Iterate over inner items and position calling passed block," do
      test = [1, 2, 3, 4]
      ans = 0
      test.my_each_with_index { |v, i| ans += i }
      expect(ans).to eq 6
    end
  end

  context "my_select" do
    it "Should kick out all elements that not pass the block condition" do
      test = [1, 2, 3, 4]
      ans = test.my_select { |i| i == 1 }
      expect(ans).to eq [1]
    end
  end
end
