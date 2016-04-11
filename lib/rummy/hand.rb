require_relative 'card'

module Rummy
  class Hand < RubyCards::Hand
    def_delegators :cards, :size
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
      rejected_card = cards.delete(card)
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
    def possible_rank_plays(init_card)
      # select_by_rank(init_card.rank) if
    end
    def rank_triplets(init_card = nil)
      result = {}
      ranks.each { |r| result[r] = select_by_rank(r) }
      result.select { |k,v| v.length > 2 }
      # result
    end
    def rank_count
      result = {}
      ranks.each { |r| result[r] = select_by_rank(r) }
      result
    end
    def ranks
      each.map { |c| c.rank }.uniq
    end
    def suits
      each.map { |c| c.suit }.uniq

    end
  end
end
