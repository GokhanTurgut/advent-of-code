# frozen_string_literal: true

elf_calories = []
current_elf_total = 0

File.foreach('input.txt') do |line|
  calories = line.to_i
  if calories.zero?
    elf_calories.push(current_elf_total)
    current_elf_total = 0
  else
    current_elf_total += calories
  end
end

# puts elf_calories.max # Part one
puts elf_calories.sort!.last(3).sum # Part two
