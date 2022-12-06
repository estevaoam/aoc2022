def item_type_priority(item_type)
  priority = ('a'..'z').to_enum.with_index(1).to_a.map(&:reverse).rassoc(item_type.downcase).first
  priority += 26 if ('A'..'Z').include?(item_type)

  priority
end



lines = File.readlines('./input.txt')
# lines = File.readlines('./example.txt')
result = lines.each_slice(3).reduce(0) do |total, group|
  rucksacks = group.map(&:chomp)

  common_item_type = rucksacks.map(&:chars).reduce(:&).first

  total + item_type_priority(common_item_type)
end

puts result

