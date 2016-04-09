require_relative 'hand'

module Rummy
  class Player
    extend Forwardable

    attr_accessor :hand, :name, :game

    def_delegator :hand, :draw, :draw
    def_delegator :game, :discard_deck, :discard_deck

    def initialize(name: 'playerOne')
      @name = name
      @hand = Hand.new
    end

    def discard(card)
      rejected_card =  hand.delete(card)
      discard_deck.add_to_discard(card)
    end
  end
end
