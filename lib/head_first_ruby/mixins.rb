class Steak
  include Comparable
  attr_accessor :grade
  GRADES = {prime: 3, choice: 2, select: 1}

  def <=> other
    case
      when GRADES[grade] < GRADES[other.grade] then -1
      when GRADES[grade] == GRADES[other.grade] then 0
      when GRADES[grade] > GRADES[other.grade] then 1
    end
  end
end

prime = Steak.new
prime.grade = :prime
choice = Steak.new
choice.grade = :choice
select = Steak.new
select.grade = :select
puts "prime > choice: #{prime > choice}"
puts "prime < select: #{prime < select}"
puts "select == select: #{select == select}"
puts "select <= select: #{select <= select}"
puts "select >= choice: #{select >= choice}"
print "choice.between?(select, prime): "
puts choice.between?(select, prime)


# case
#   when s1 > s2
#     puts "I will have the #{s1}"
#   when s1 == s2
#     puts "Meh"
#   when s1 < s2
#     puts "I will have the #{s1}"
# end