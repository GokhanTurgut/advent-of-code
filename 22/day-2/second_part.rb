# frozen_string_literal: true

opponent_translation = {
  A: :rock,
  B: :paper,
  C: :scissors
}

shape_scores = {
  rock: 1,
  paper: 2,
  scissors: 3
}

outcome_translation = {
  X: :lose,
  Y: :draw,
  Z: :win
}

def calculate_score(opponent, player)
  return 3 if opponent == player

  score = 0
  score = 6 if opponent == :rock && player == :paper
  score = 6 if opponent == :paper && player == :scissors
  score = 6 if opponent == :scissors && player == :rock
  score
end

def shape_chooser(opponent, outcome)
  return opponent if outcome == :draw

  if opponent == :rock
    return :paper if outcome == :win
    return :scissors if outcome == :lose
  end
  if opponent == :paper
    return :scissors if outcome == :win
    return :rock if outcome == :lose
  end
  if opponent == :scissors
    return :rock if outcome == :win
    return :paper if outcome == :lose
  end
end

score = 0

File.foreach('input.txt') do |line|
  opponent_shape = opponent_translation[line[0].to_sym]
  player_shape = shape_chooser(opponent_shape, outcome_translation[line[2].to_sym])
  score += calculate_score(opponent_shape, player_shape)
  score += shape_scores[player_shape]
end

puts score
