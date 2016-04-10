require 'forwardable'
require_relative 'hand'
require_relative 'rank_play'
require_relative 'suit_play'

module Rummy
  class Player
    extend Forwardable

    attr_accessor :hand, :name, :game, :play_deck

    def_delegator :@hand, :draw, :draw
    def_delegator :@game, :discard_deck, :discard_deck

    def initialize(name: 'playerOne')
      @name = name
      @hand = Hand.new
      @play_deck = PlayDeck.new(self)
    end

    def discard(card)
      rejected_card =  hand.discard(card)
      discard_deck.add_to_discard(card)
    end
  end
end
