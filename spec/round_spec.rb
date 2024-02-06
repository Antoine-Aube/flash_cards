require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do 

  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe "intialiuze" do 
    it "exists and has a deck, and empty turns" do 
      expect(@round).to be_a(Round)

      expect(@round.deck).to eq(@deck)
    end
  end

  describe "instance methods" do 
    it "#current_card" do
      expect(@round.current_card).to eq(@card_1)
    end

    it "#take_turn" do 
      new_turn = @round.take_turn("Juneau")
      # require 'pry';binding.pry
      expect(new_turn).to be_a(Turn)
      expect(new_turn.correct?).to eq(true)
    end

    it "expect"
  end
end