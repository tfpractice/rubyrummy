require_relative 'card'
module Rummy
  class Hand < RubyCards::Hand

    def_delegators :cards, :size, :[]

    def discard(card)
      rejected_card = cards.delete(card)
    end

    def select_card(rank, suit)
      cards.select { |c| c.rank == rank && c.suit == suit }.first
    end

    def select_by_suit(suit)
      cards.select { |c| c.suit == suit }.sort_by(&:rank_id)
    end

    def select_by_rank(rank)
      cards.select { |c| c.rank == rank }.sort_by(&:rank_id)
    end

    def possible_rank_plays(init_card)
    end

    def rank_triplets
      group_by_rank.select { |k, v| v.length > 2 }
    end

    def suit_consecutives
      newHash = group_by_suit.each_value.map { |g|  g.each_cons(2).select{ |x, y| y.rank == x.succ_rank } }
    end

    def group_by_suit
      suits.each_with_object({}) { |s, h| h[s] = select_by_suit(s)  }
    end

    def group_by_rank
      ranks.each_with_object({}) { |r, h| h[r] = select_by_rank(r)  }
    end

    def ranks
      each.map(&:rank).uniq
    end

    def suits
      each.map(&:suit).uniq
    end
  end
end
