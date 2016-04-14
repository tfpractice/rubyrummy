require 'forwardable'
require_relative 'hand'
require_relative 'rank_play'
require_relative 'suit_play'

module Rummy
  class Player
    extend Forwardable

    attr_accessor :hand, :name, :game, :play_deck, :prep_stack

    def_delegator :@game, :discard_deck, :discard_deck
    def_delegators :@hand, :draw, :select_card

    def initialize(name: 'playerOne')
      @name = name
      @hand = Hand.new
      @play_deck = PlayDeck.new(self)
      @prep_stack = []
    end

    def discard(card)
      rejected_card =  hand.discard(card)
      discard_deck.add_to_discard(card)
    end

    def add_to_prep_stack(card)
      prep_stack.push(card)
      prep_stack.sort_by(&:rank_id)
    end
  end
end
