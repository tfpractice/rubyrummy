module Rummy
  class Card < RubyCards::Card

    def pred_rank
      pred_id = (rank_id - 1) % ranks_length
      Rummy::Deck.ranks[pred_id].to_s
    end

    def succ_rank
      succ_id = (rank_id + 1) % ranks_length
      Rummy::Deck.ranks[succ_id].to_s
    end

    def rank_id
      Rummy::Deck::RANKS.index(@rank) || Rummy::Deck::RANKS.index(rank)
    end

    def ranks_length
      Rummy::Deck.ranks.length
    end

    def neighbors?(card_arg)
      card_arg.rank == pred_rank || card_arg.rank == succ_rank
    end
  end
end
