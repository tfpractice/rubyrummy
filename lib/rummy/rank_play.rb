module Rummy
  class RankPlay < RubyCards::Hand
    def initialize(cards = [])
      raise "too few cards: #{cards.length}" unless min_count?(cards)
      raise "cards must be of same rank" unless shared_rank?(cards)
      super
    end
    def min_count?(cards)
      cards.length >= 3
    end

    def shared_rank?(cards)
      first_rank = cards[0].rank
      cards.all? { |c| c.rank == first_rank  }

    end
  end
end
