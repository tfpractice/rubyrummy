module Rummy
  class Card < RubyCards::Card
    # def initialize(args)

    # end

    def pred
      pred_id = (rank_id - 1) % Rummy::Deck::RANKS.length
      pred_rank = Rummy::Deck::RANKS[pred_id]
    end

    def succ
      succ_id = (rank_id + 1) % Rummy::Deck::RANKS.length
      succ_rank = Rummy::Deck::RANKS[succ_id]
    end
    def rank_id
      Rummy::Deck::RANKS.index(rank)
    end


  end
end
