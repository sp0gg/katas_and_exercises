def zero(*exp)
  calculate(0, *exp)
end
def one(*exp)
  calculate(1, *exp)
end
def two(*exp)
  calculate(2, *exp)
end
def three(*exp)
  calculate(3, *exp)
end
def four(*exp)
  calculate(4, *exp)
end
def five(*exp)
  calculate(5, *exp)
end
def six(*exp)
  calculate(6, *exp)
end
def seven(*exp)
  calculate(7, *exp)
end
def eight(*exp)
  calculate(8, *exp)
end
def nine(*exp)
  calculate(9, *exp)
end
def plus(num)
  [:+, num]
end
def minus(num)
  [:-, num]
end
def times(num)
  [:*, num]
end
def divided_by(num)
  [:/, num]
end

def calculate(num, *exp)
  return num if exp.empty?
  [num, exp[0][1]].inject(exp[0][0])
end
