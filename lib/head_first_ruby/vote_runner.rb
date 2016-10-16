require_relative 'candidate'

puts "run"

lines = File.open('votes.txt') { |file| file.readlines }
tallies = Hash.new(0)
lines.each do |line|
  name = line.chomp.downcase
  tallies[name] += 1
end

tallies.each {|k, v| puts "#{k} votes: #{v}"}

c = Candidate.new('joe', occ: 'stuff', hobby:'whatev')
# c = Candidate.new('joe', {:occ => 'stuff', :hobby =>'whatev'}) #both of these work

d = c.dup
d.home = 'yowut'

p c, c.object_id
p d, d.object_id