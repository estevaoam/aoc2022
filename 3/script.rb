def item_type_priority(item_type)
  priority = ('a'..'z').to_enum.with_index(1).to_a.map(&:reverse).rassoc(item_type.downcase).first
  priority += 26 if ('A'..'Z').include?(item_type)

  priority
end

rucksacks = File.readlines('./input.txt')
# rucksacks = File.readlines('./example.txt')
puts (rucksacks.reduce(0) do |total, rucksack|
  rucksack = rucksack.chomp

  half = rucksack.length / 2 - 1
  comp_1 = rucksack[0..half]
  comp_2 = rucksack[(half + 1)..-1]

  puts rucksack
  puts comp_1.chars.inspect
  puts comp_2.chars.inspect

  wrong_item_type = (comp_1.chars & comp_2.chars).first
  priority = item_type_priority(wrong_item_type)

  puts "Wrong item type: #{wrong_item_type}"
  puts "Priority: #{priority}"
  puts "====="

  total + priority
end)

