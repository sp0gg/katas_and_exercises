NUM_MAP = {
    zero: 0,
    one: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9
}

OP_MAP = {
    plus: :+,
    minus: :-,
    times: :*,
    divided_by: :/
}

def method_missing(arg, *exp)
  super(arg) if !NUM_MAP.has_key?(arg) && !OP_MAP.has_key?(arg)
  return calculate(NUM_MAP[arg], *exp) if NUM_MAP.has_key?(arg)
  get_op_pair(arg, exp[0]) if OP_MAP.has_key?(arg)
end

def calculate(num, *exp)
  return num if exp.empty?
  [num, exp[0][1]].inject(OP_MAP[exp[0][0]])
end

def get_op_pair(op, num)
  num += 0.0 if op == :divided_by
  [op, num]
end
