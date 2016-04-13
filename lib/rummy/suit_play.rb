module Rummy
  class SuitPlay < RubyCards::Hand
    def initialize(cards = [])
      raise "too few cards: #{cards.length}" unless min_count?(cards)
      raise "cards must be of same suit" unless shared_suit?(cards)
      raise "cards must be consecutive" unless consecutive?(cards)
      super
    end


    def min_count?(cards)
      cards.length >= 3
    end

    def shared_suit?(cards)
      first_suit = cards[0].suit
      cards.all? { |c| c.suit == first_suit }
    end

    def consecutive?(cards)
      cards.sort.each_cons(2).all? { |x, y| y.rank == x.succ_rank.to_s }
    end
  end
end
