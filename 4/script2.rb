system "clear"

def overlaps?(a, b)
  (b[0] <= a[1] && b[0] >= a[0])
end

lines = File.readlines('./input.txt')
# lines = File.readlines('./example.txt')
total = lines.reduce(0) do |total, line|
  pair_1, pair_2 = line.chomp.split(',')
    .map do |pair| 
      pair.split('-').map(&:to_i)
    end

  puts "===================="
  puts "line: #{line}"
  puts "pair 1: #{pair_1}, pair 2: #{pair_2}"
  puts "overlaps? #{overlaps?(pair_1, pair_2)}"

  next (total + 1) if overlaps?(pair_1, pair_2) || overlaps?(pair_2, pair_1)
  
  total
end

puts total

