require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'turn.rb'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 1
    @number_correct = 0
  end

  def current_card
    @deck.cards[@turn_number - 1]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @turn_number += 1
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
    float = (@number_correct.to_f/@turns.count.to_f) * 100.0
    "#{float.round(0)}%"
  end

  def percent_correct_by_category(category)
    float = (number_of_correct_by_category(category).to_f/total_by_category(category)) * 100.0
    "#{float.round(0)}%"
  end

  def start
    puts "Welcome! You're playing with #{deck_size} cards"
    puts "------------------------"
    while @turn_number <= deck_size
      puts "This is card #{@turn_number} out of #{deck_size} "
      puts "#{current_card.question}"
      guess = gets.chomp
      turn = take_turn(guess)
      puts turn.feedback
    end
    puts "***** GAME OVER *****"
    puts "You had #{@number_correct} correct guesses out of #{deck_size} for total score of #{percent_correct}"
    score_output
  end

  def score_output
    categories = @deck.cards.map {|card| card.category }.uniq
    for category in categories
      puts "#{category} - #{percent_correct_by_category(category)} correct"
    end
    puts "Thanks for playing!"
  end

  private

  def total_by_category(category) 
    @turns.find_all do |turn|
      turn.card.category == category
    end.length
  end

  def deck_size
    @deck.cards.length
  end
end