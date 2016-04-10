require_relative 'deck'

module Rummy
  class PlayDeck < Deck
    def initialize(player)
      @player = player
      super
    end


  end
end
