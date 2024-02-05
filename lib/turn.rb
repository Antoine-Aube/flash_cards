class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    self.card.answer == self.guess ? true : false
  end

  def feedback
    self.correct? ? "Correct!" : "Incorrect"
  end
end