def generate_deck
  cards = (1..13).to_a
  suits = ["diamonds", "clubs", "hearts", "spades"]
  deck = []

  suits.each do |suit|
    cards.each do |card|
      deck << [card, suit]
    end
  end

  deck # this is what calls the generation, it can only be accessed from generate_deck so that it cant be used in any other context
end

def shuffle_deck(deck)
  deck.shuffle # shuffle is a default array class method, didnt create anything here
end

def card_label(card, format: :short) # by default we will only show short so it will display suit symbols rather then name.
  card_labels = { 1 => "Ace", 11 => "Jack", 12 => "Queen", 13 => "King" }
  card_suit_labels = { "Diamonds" => "♦", "Clubs" => "♣", "Spades" => "♠", "Hearts" => "♥" }

  card_index, card_suit = card
  label = card_labels[card_index] || card_index
  icon = card_suit_labels[card_suit]

  if format == :short
    "#{label}#{icon}"
  else
    "#{label} of #{card_suit}"
  end
end
