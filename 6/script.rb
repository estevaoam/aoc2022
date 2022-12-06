system('clear')

line = File.readlines('input.txt').first
example_line = File.readlines('example.txt').first

MSG_SIZE = 14

def run(line) 
  buffer = []
  last = nil

  line.chars.to_enum.with_index do |char, i|
    if buffer.uniq.size == MSG_SIZE
      last = i + 1
      return last
    end

    buffer.shift if buffer.size == MSG_SIZE
  end

  last
end

def test!(line)
  result = run(line)
  raise "Error! Test with example failed: #{result}" unless result == 19
end

test!(example_line)

puts "Result: #{run(line)}"


