module Rummy
  class Card < RubyCards::Card

    def pred_rank
      pred_id = (rank_id - 1) % ranks_length
      Rummy::Deck.ranks[pred_id]
    end

    def succ_rank
      succ_id = (rank_id + 1) % ranks_length
      Rummy::Deck.ranks[succ_id]
    end

    def rank_id
      Rummy::Deck::RANKS.index(@rank) || Rummy::Deck::RANKS.index(rank)
    end

    def ranks_length
      Rummy::Deck.ranks.length
    end
  end
end
