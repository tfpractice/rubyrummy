require_relative 'card'

module Rummy
  class Hand < RubyCards::Hand
    def_delegators :cards, :size
    # def initialize(args)
    #
    # end
    def discard(deck, card)
      n.times do
        @cards << deck.draw unless deck.empty?
      end
      # self
    end

  end
end
