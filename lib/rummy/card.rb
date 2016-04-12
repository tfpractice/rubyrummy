module Rummy
  class Card < RubyCards::Card
    # def initialize(args)

    # end

    def pred
      pred_id = (rank_id - 1) %  ranks_length
      pred_rank = Rummy::Deck::RANKS[pred_id]
    end

    def succ
      succ_id = (rank_id + 1) % ranks_length
      succ_rank = Rummy::Deck::RANKS[succ_id]
    end
    def rank_id
      Rummy::Deck::RANKS.index(rank)
    end
    def ranks_length
      Rummy::Deck::RANKS.length
    end
  end
end
