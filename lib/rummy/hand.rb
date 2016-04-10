require_relative 'card'

module Rummy
  class Hand < RubyCards::Hand
    def_delegators :cards, :size,
      # def initialize(args)
      #
      # end
      #def discard(deck, card)
      #  n.times do
      #    @cards << deck.draw unless deck.empty?
      #  end
      #  # self
      #end
    def discard(card)
      rejected_card =  cards.delete(card)
    end
    def select_card(rank, suit)
      cards.select { |c| c.rank == rank && c.suit == suit }.first
    end
    def select_by_suit(suit)
      cards.select { |c| c.suit == suit }

    end
    def select_by_rank(rank)
      cards.select { |c| c.rank == rank }

    end

  end
end
