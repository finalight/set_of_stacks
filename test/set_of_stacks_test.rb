require "./test/test_helper"
require "minitest/autorun"
require "minitest/spec"

class SetOfStacksTest < Minitest::Test
  describe "push method" do
    it "Should show the correct value" do
      setOfStacks = SetOfStacks.new
      setOfStacks.push 1

      setOfStacks.peek.must_equal 1
    end

    it "Should show correct value for next stack" do
      setOfStacks = SetOfStacks.new
      setOfStacks.push 1
      setOfStacks.push 2
      setOfStacks.push 3
      setOfStacks.peek.must_equal 3
    end
  end

  describe "pop method" do
    it "Should show the correct popped value" do
      setOfStacks = SetOfStacks.new
      setOfStacks.push 1
      setOfStacks.push 2

      setOfStacks.pop.must_equal 2
    end

    it "Should throw error when there's nothing to pop" do
      setOfStacks = SetOfStacks.new
      -> { setOfStacks.pop }.must_raise Stack::UnderflowError
    end
  end
end
