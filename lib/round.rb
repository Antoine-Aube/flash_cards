require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'turn.rb'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    if turn.correct?
      @number_correct += 1
    end
    turn
  end

  def number_of_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end.length
  end

  def percent_correct
    (@number_correct.to_f/@turns.length.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    (number_of_correct_by_category(category).to_f/total_by_category(category)) * 100.0
  end

  private

  def total_by_category(category) 
    @turns.find_all do |turn|
      turn.card.category == category
    end.length
  end
end