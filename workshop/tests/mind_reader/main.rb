def mind_reader
  magic_number = 4
  max_guesses = 3
  attempts = 1
  guess = nil
  while guess != magic_number
    print 'nope!' unless guess.nil?
    puts 'what is your guess?'
    guess = gets.chomp.to_i
    break if attempts >= max_guesses

    attempts += 1
  end
  winner = 'you got it!'
  loser = 'ran outta guesses'
  puts guess == magic_number ? winner : loser
end

mind_reader
