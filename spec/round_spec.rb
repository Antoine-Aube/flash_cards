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
      expect(@round.turns.length).to eq(1)
      expect(@round.turns).to eq([new_turn])
    end

    it "has an instance variable of number correct" do
      expect(@round.number_correct).to eq(0)
      new_turn = @round.take_turn("Juneau")
      expect(@round.number_correct).to eq(1)
    end

    it "goes to next card in the deck when a turn is taken" do 
      expect(@round.current_card).to eq(@card_1)
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
    end
    
    it "accumulate multiple turns and will know if the last cards feedback" do 
      expect(@round.current_card).to eq(@card_1)
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
      turn_2 = @round.take_turn("Venus")
      
      expect(@round.turns.count).to eq(2)
      expect(@round.number_correct).to eq(1)
      expect(@round.turns.last.feedback).to eq("Incorrect.")
    end
    
    it "can count the number of cards that were guessed correctly by category" do
      expect(@round.current_card).to eq(@card_1)
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
      turn_2 = @round.take_turn("Venus")
      
      expect(@round.number_of_correct_by_category(:Geography)).to eq(1)
      # require 'pry';binding.pry
    end

    it "can calculate the percentage of correct answers" do 
      expect(@round.current_card).to eq(@card_1)
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
      turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct).to eq(50.0)
    end

    it "can calculate percetage correct by category" do 
      expect(@round.current_card).to eq(@card_1)
      new_turn = @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
      turn_2 = @round.take_turn("Venus")
      expect(@round.percent_correct).to eq(50.0)
      
      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end
end