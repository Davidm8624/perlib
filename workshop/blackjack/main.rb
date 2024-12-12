def generate_deck
  cards = (1..13).to_a

  suits = %w[Diamonds Clubs Spades Hearts]

  deck = []

  suits.each do |suit|
    cards.each do |card|
      deck << [card, suit]
    end
  end

  deck
end

def shuffle_deck(deck)
  deck.shuffle
end

def inspect_cards(cards, format: :short)
  hand = cards.map { |c| card_label(c, format: format) }.join(',')
  total = calculate_total(cards)

  "#{hand} (#{total})"
end

def card_label(card, format: :short)
  card_labels = { 1 => 'Ace', 11 => 'Jack', 12 => 'Queen', 13 => 'King' }
  card_suit_labels = { 'Diamonds' => '♦', 'Clubs' => '♣', 'Spades' => '♠', 'Hearts' => '♥' }

  card_index, card_suit = card
  label = card_labels[card_index] || card_index
  icon = card_suit_labels[card_suit]

  format == :short ? "#{label}#{icon}" : "#{label} of #{card_suit}"
end

def calculate_total(hand)
  hand.inject(0) { |sum, card| sum + card_value(card[0]) }
end

def card_value(card)
  case card
  when 11..13 then 10
  when 1 then 11
  else card
  end
end

def deal_cards(deck, amount)
  deck.shift(amount)
end

def play(deck)
  player_hand = deal_cards(deck, 2)
  dealer_hand = deal_cards(deck, 2)

  Rails.logger.debug { "Player has: #{inspect_cards(player_hand)}" }
  Rails.logger.debug { "Dealer has: #{inspect_cards([dealer_hand[0]])}, <other card hidden>" }

  choice = nil

  while choice != 'stay' && calculate_total(player_hand) <= 21
    Rails.logger.debug 'Do you want to hit or stay?'
    choice = gets.chomp

    player_hand += deal_cards(deck, 1) if choice == 'hit'

    Rails.logger.debug { "Your cards are now: #{inspect_cards(player_hand)}" }
  end

  dealer_hand += deal_cards(deck, 1) while calculate_total(dealer_hand) <= 17

  player_total = calculate_total(player_hand)
  dealer_total = calculate_total(dealer_hand)

  if player_total > 21
    Rails.logger.debug { "Player busts! #{player_total}" }
  elsif player_total == 21 && dealer_total != 21
    Rails.logger.debug '21! A winner!'
  elsif player_total > dealer_total || dealer_total > 21
    Rails.logger.debug 'Player wins!'
  elsif player_total == dealer_total
    Rails.logger.debug "It's a tie!"
  else
    Rails.logger.debug 'Dealer wins!'
  end

  Rails.logger.debug { "Dealer hand: #{inspect_cards(dealer_hand)}" }
  Rails.logger.debug { "Player hand: #{inspect_cards(player_hand)}" }
end

shuffled_deck = shuffle_deck(generate_deck)

choice = 'y'

while shuffled_deck.length > 4 && !choice.casecmp('n').zero?
  Rails.logger.debug { "Deck has: #{shuffled_deck.length} cards left" }
  Rails.logger.debug 'Do you want to play a hand?[Yn]'
  choice = gets.chomp

  play(shuffled_deck) if choice.casecmp('y').zero?
end
