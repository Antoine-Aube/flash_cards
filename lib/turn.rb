class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @card.answer == @guess ? true : false
  end

  def feedback
    self.correct? ? "Correct!" : "Incorrect"
  end
end