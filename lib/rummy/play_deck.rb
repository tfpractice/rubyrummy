require_relative 'deck'

module Rummy
  class PlayDeck < Deck
    attr_accessor :plays
    def initialize(player)
      @player = player
      @plays = []
      super
    end

    def add_play(newPlay)
      plays << newPlay
    end


  end
end
