# SetOfStacks

## Question

Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOf Stacks that mimics this.

SetOf Stacks should be composed of several stacks and should create a new stack once the previous one exceeds capacity. SetOf Stacks.push() and SetOf Stacks.pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack).
 
## Assumptions

- We're going to assume the item are actually plate with a number label on it.
- Therefore, SetOfStack.push 1 means that we're pushing a plate with a number '1' label to the stack
- Default size of a single stack is 2
- SetOfStack can define size of the single stack, and it will be the same throughout all the stacks

