require_relative 'deck'

module Rummy
  class DiscardDeck < Deck
    # def initialize(args)
    #
    # end

    def add_to_discard(card)
      @cards.unshift(card)
    end
  end
end
