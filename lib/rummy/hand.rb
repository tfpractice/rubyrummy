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

    def pred_rank?(card)
      suit_ranks(card.suit).include?(card.pred_rank)
    end

    def next_rank?(card)
      suit_ranks(card.suit).include?(card.succ_rank)
    end

    def suit_ranks(suit)
      select_by_suit(suit).map(&:rank)
    end

    def suit_consecutives
      group_by_suit.each_with_object({}) do |(k, v), h|
        h[k] = v.select { |c| pred_rank?(c) || next_rank?(c) }
      end
    end

    def sandbox
      group_by_suit.each_with_object({}) do |(k, v), h|
        h[k] = []
        v.to_set.divide { |x, y| x.neighbors?(y)  }
        h[k] << v.select { |c| pred_rank?(c) || next_rank?(c) }
      end
    end
    def get_neighbors(card)
      suit_consecutives[card.suit].select { |n| card.neighbors?(n) }
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
