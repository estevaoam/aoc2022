# A = Rock
# B = Paper
# C = Scissors
# X = Rock
# Y = Paper
# Z = Scissors
#
# -- Scores
#
# Rock = 1
# Paper = 2
# Scissors = 3
#
# Lost = 0
# Draw = 3
# Won = 6

rounds = File.readlines('input.txt')

def round_result(my_shape, opponent_shape)
  a = my_shape
  b = opponent_shape

  return :lose if a == :rock && b == :paper ||
              a == :paper && b == :scissors ||
              a == :scissors && b == :rock

  return :draw if a == b

  :win
end

def round_result_in_points(round_result)
  { lose: 0, 
    draw: 3, 
    win: 6 }[round_result]
end

def shape_from_round_result(other_shape, result)
  return :rock if result == :win && other_shape == :scissors
  return :rock if result == :draw && other_shape == :rock
  return :rock if result == :lose && other_shape == :paper

  return :paper if result == :win && other_shape == :rock
  return :paper if result == :draw && other_shape == :paper
  return :paper if result == :lose && other_shape == :scissors

  return :scissors if result == :win && other_shape == :paper
  return :scissors if result == :draw && other_shape == :scissors
  :scissors if result == :lose && other_shape == :rock
end

def input_to_round_result(input)
  {
    'X' => :lose,
    'Y' => :draw,
    'Z' => :win
  }[input]
end

def input_to_shape(input)
  { 'A' => :rock,
    'B' => :paper,
    'C' => :scissors,
    'X' => :rock,
    'Y' => :paper,
    'Z' => :scissors }[input]
end

def shape_to_point(shape)
  { rock: 1,
    paper: 2,
    scissors: 3 }[shape]
end

total_score = rounds.reduce(0) do |total, round|
  opponent_shape, round_result = round.split(' ')
  opponent_shape = input_to_shape(opponent_shape)
  round_result = input_to_round_result(round_result)

  my_shape = shape_from_round_result(opponent_shape, round_result)

  total + round_result_in_points(round_result) + shape_to_point(my_shape)
end

puts total_score
