system "clear"

lines = File.readlines('input.txt')
example_lines = File.readlines('example.txt')

def result_from_stacks(stacks)
  stacks.values.map(&:last).join
end

def perform_action(stacks, action)
  type, qty, from, to = action

  return unless type == :move

  moved_crates = stacks[from].pop(qty)
  stacks[to].push(*moved_crates)
end

def extract_stacks(lines)
  crates = {}
  lines.each do |line|
    break if /move/ =~ line

    m = line.to_enum(:scan, /\[([A-Z])\]/).map { Regexp.last_match }
    m.each do |crate|
      i = crate.offset(0).first.to_i
      (crates[i] ||= []) << crate.captures.first
      next
    end
  end

  crates.transform_keys { |key| key / 4 + 1 }.transform_values(&:reverse)
    .sort_by { |key, value| key }.to_h
end

def extract_actions(lines)
  lines.each_with_object([]) do |line, actions|
    cols = line.split(' ')
    next unless cols.any? { |col| col == 'move' }

    type, qty, from, to = cols.values_at(0, 1, 3, 5)

    actions << [type.to_sym, qty.to_i, from.to_i, to.to_i]
  end
end

def run(lines = []) 
  stacks = extract_stacks(lines)

  puts "Stack: "
  puts stacks

  actions = extract_actions(lines)
  actions.each do |action|
    perform_action(stacks, action)
  end

  result_from_stacks(stacks)
end

def test!(lines)
  result = run(lines)
  raise "Error! Test with example failed: #{result}" unless result == 'MCD'
end

test!(example_lines)

puts "Result: #{run(lines)}"


