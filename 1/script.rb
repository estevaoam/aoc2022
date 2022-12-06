input = File.readlines('./input.txt')

elves = []
input.reduce(0) do |current, line|
  filtered_line = line.delete("\n")
  puts filtered_line.inspect
  if filtered_line == '' || filtered_line.nil?
    elves << current

    next 0
  end

  puts filtered_line.inspect
  number = Integer(filtered_line)
  current + number
end

puts elves.max(3)
puts
puts elves.max(3).sum

