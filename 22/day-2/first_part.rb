# frozen_string_literal: true

player_translation = {
  X: :rock,
  Y: :paper,
  Z: :scissors
}

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

def calculate_score(opponent, player)
  return 3 if opponent == player

  if opponent == :rock
    return 6 if player == :paper
    return 0 if player == :scissors
  end
  if opponent == :paper
    return 6 if player == :scissors
    return 0 if player == :rock
  end
  if opponent == :scissors
    return 6 if player == :rock
    return 0 if player == :paper
  end
end

score = 0

File.foreach('input.txt') do |line|
  opponent_shape = opponent_translation[line[0].to_sym]
  player_shape = player_translation[line[2].to_sym]
  score += calculate_score(opponent_shape, player_shape)
  score += shape_scores[player_shape]
end

puts score
