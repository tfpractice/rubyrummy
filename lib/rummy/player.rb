require_relative 'hand'

module Rummy
  class Player
    extend Forwardable

    attr_accessor :hand, :name, :game

    def_delegator :@hand, :draw, :draw

    def initialize(name: 'playerOne')
      @name = name
      @hand = Hand.new
    end


  end
end
