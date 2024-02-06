require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# @card_4 = Card.new("What's the capital of Utah", "Salt Lake City?", :Geography)
# @card_5 = Card.new("Who climbed the world's first 5.15a?", "Chris Sharma", :Climbing)
# @card_6 = Card.new("Who was the first persont flash 5.15a?", "Adam Ondra", :Climbing)
# @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
@deck = Deck.new(CardGenerator.new('./cards.txt').cards)
@round = Round.new(@deck)

puts @round.start