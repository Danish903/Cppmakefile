#include <simpleStack.h>

Stack::Stack() { top = 0; }

void Stack::push(StackType d) {

  if (top == STACK_SIZE)
    throw std::overflow_error("push: Stack is full");

  // note: these two lines can be written as "data[top++] = d;"    
  data[top] = d;
  
  top++;
}

StackType Stack::pop() {

  if (top == 0)
    throw std::underflow_error("pop: Stack is empty");
    
  // note: these two lines can be written as "return data[--top];"
  --top;

  return data[top];
}

StackType Stack::peek() {

  if (top == 0)
    throw std::underflow_error("peek: Stack is empty");
    
  return data[top-1];
}

