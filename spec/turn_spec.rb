require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  let(:card)  { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:turn)  { Turn.new("wronganswer", card) }
  let(:turn_2)  { Turn.new("Juneau", card) }
  describe "initialize" do 
    it "exists" do 

      expect(turn).to be_a(Turn)
    end

    it "has a card which is a card object as an instance variable" do 
      expect(turn.card).to be_a(Card)
      expect(turn.card).to eq(card)
    end
  end

  describe "instance methods" do
    it "#correct?" do 
      expect(turn_2.correct?).to eq(true)
      expect(turn.correct?).to eq(false)
    end

    it "feedback" do 
      expect(turn_2.feedback).to eq("Correct!")
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end