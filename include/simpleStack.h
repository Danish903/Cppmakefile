#ifndef _STACK_H
#define _STACK_H

#include <stdexcept> 

const uint32_t
  STACK_SIZE = 256; //  suduko board size is 256 elements (16x16) 
  
typedef int StackType;

class Stack {
public:
  Stack();
  ~Stack() = default;
  
  uint32_t size() { return top; }
  bool isEmpty() { return top == 0; }
  
  void clear() { top = 0; }
  
  void push(StackType d);
  StackType pop();
  StackType peek();
  
private:
  StackType
    data[STACK_SIZE];
  uint32_t
    top;
};

#endif

