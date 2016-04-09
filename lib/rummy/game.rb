require_relative 'player'
require_relative 'main_deck'
require_relative 'discard_deck'

module Rummy
  class Game
    attr_reader :main_deck, :discard_deck, :players, :current_player
    def initialize(players: [])
      @players = players
      @main_deck = MainDeck.new()
      @discard_deck = DiscardDeck.new()
      if players.length == 0
        2.times do |p_num|
          @players << Player.new(name: "player#{p_num}")
        end
      end
      players.each { |p| p.game = self }
      @current_player = players[0]
    end

    def deal
      main_deck.shuffle!
      # players.product([0...7]).each { |p, c| puts "p:#{p}__c#{c}"  }
      7.times do |n|
        players.each { |p| p.draw(main_deck) }
      end
    end
    def switch_player
      next_index =  ((players.index(current_player) + 1) % players.length)
      self.current_player = players[next_index]
    end

    private

    def current_player=(player)
      @current_player = player
    end

  end
end
