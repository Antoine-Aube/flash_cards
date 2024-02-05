require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  let(:card)  { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:turn)  { Turn.new("Juneau", card) }
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
      expect(turn.correct?).to eq(true)
    end

    it "feedback" do 
      expect(turn.feedback).to eq("Correct!")
    end
  end
end