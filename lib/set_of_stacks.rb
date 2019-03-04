
# This code has the following assumptions
# We're going to assume the item are actually plate with a number label on it.
# Therefore, SetOfStack.push 1 means that we're pushing a plate with a number '1' label to the stack
# Default size of a single stack is 2
# SetOfStack can define size of the single stack, and it will be the same throughout all the stacks

require "forwardable"
require "stack"

class SetOfStacks
  extend Forwardable

  UnderflowError = Class.new StandardError

  def_delegators :@stacks, :empty?, :size

  attr_reader :max_size

  def initialize(max_size = 2)
    @stacks = []
    @max_size = max_size
    newStack = Stack.new(max_size)
    @stacks.push newStack
  end

  def push(item)
    if @stacks.last.size >= @max_size
      newStack = Stack.new
      newStack.push item
      @stacks.push newStack
    else
      currentStack = @stacks.last
      currentStack.push item
    end
  end

  def pop
    fail UnderflowError, "Nothing to pop!" if empty?
    if @stacks.length > 0
      currentStack = @stacks.last
      value = currentStack.pop

      if currentStack.size <= 0
        @stacks.pop
      end
    end
    return value
  end

  def peek
    fail UnderflowError, "Nothing to peek!" if empty?
    @stacks.last.peek
  end
end
