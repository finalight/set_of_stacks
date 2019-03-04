require "./test/test_helper"
require "minitest/autorun"
require "minitest/spec"

class StackTest < Minitest::Test
  describe "initialization" do
    before do
      @stack = Stack.new
    end
    it "Should be empty by default" do
      @stack.must_be_empty
    end

    it "Should have default size of 2" do
      Stack.new.max_size.must_equal 2
    end
  end

  describe "push method" do
    it "Should show the correct value after pushing" do
      stack = Stack.new
      stack.push 1
      stack.push 2
      stack.peek.must_equal 2
    end

    it "Should throw error if stack is overflow" do
      stack = Stack.new
      stack.push 1
      stack.push 2
      -> { stack.push 3 }.must_raise Stack::OverflowError
    end
  end

  describe "pop method" do
    it "Should show the correct popped value" do
      stack = Stack.new
      stack.push 1
      stack.push 2
      stack.pop.must_equal 2
    end

    it "Should throw error if stack is empty" do
      stack = Stack.new
      -> { stack.pop }.must_raise Stack::UnderflowError
    end
  end

  describe "peek method" do
    it "Should show the correct value when peeking" do
      stack = Stack.new
      stack.push 1
      stack.push 2

      stack.peek.must_equal 2
      stack.pop
      stack.peek.must_equal 1
    end
  end
end
