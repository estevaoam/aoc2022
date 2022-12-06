system "clear"

def contains_one_another?(a, b)
  (a[0] <= b[0] && a[1] >= b[1]) || 
    (b[0] <= a[0] && b[1] >= a[1])
end

# lines = File.readlines('./input.txt')
lines = File.readlines('./example.txt')
total = lines.reduce(0) do |total, line|
  pair_1, pair_2 = line.chomp.split(',')
    .map do |pair| 
      pair.split('-').map(&:to_i)
    end

  puts "===================="
  puts "line: #{line}"
  puts "pair 1: #{pair_1}, pair 2: #{pair_2}"
  puts "contains? #{contains_one_another?(pair_1, pair_2)}"

  next (total + 1) if contains_one_another?(pair_1, pair_2)
  
  total
end

puts total

