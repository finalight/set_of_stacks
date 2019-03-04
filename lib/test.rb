require "minitest/autorun"
require_relative "stack"
require_relative "set_of_stacks"

class TestMeme < Minitest::Test
  describe "Stack" do
    describe "initialization" do
      it "Should be empty by default" do
        Stack.new.must_be_empty
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

  describe "SetOfStack" do
    describe "push method" do
      it "Should show the correct value" do
        setOfStacks = SetOfStack.new
        setOfStacks.push 1

        setOfStacks.peek.must_equal 1
      end

      it "Should show correct value for next stack" do
        setOfStacks = SetOfStack.new
        setOfStacks.push 1
        setOfStacks.push 2
        setOfStacks.push 3
        setOfStacks.peek.must_equal 3
      end
    end

    describe "pop method" do
      it "Should show the correct popped value" do
        setOfStacks = SetOfStack.new
        setOfStacks.push 1
        setOfStacks.push 2

        setOfStacks.pop.must_equal 2
      end

      it "Should throw error when there's nothing to pop" do
        setOfStacks = SetOfStack.new
        -> { setOfStacks.pop }.must_raise Stack::UnderflowError
      end
    end
  end
end
