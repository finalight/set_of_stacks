require "forwardable"

class Stack
  OverflowError = Class.new StandardError
  UnderflowError = Class.new StandardError

  extend Forwardable

  def_delegators :@ary, :empty?, :size

  attr_reader :max_size

  def initialize(max_size = 2)
    @ary = []
    @max_size = max_size
  end

  def push(item)
    fail OverflowError, "Stack is full!" if size >= max_size
    @ary.push item
  end

  def pop
    fail UnderflowError, "Nothing to pop!" if empty?
    @ary.pop
  end

  def peek
    fail UnderflowError, "Nothing to peek!" if empty?
    @ary.last
  end
end
