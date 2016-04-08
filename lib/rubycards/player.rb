require_relative 'hand'

module RubyCards
  class Player
    attr_accessor :hand, :name
    def initialize(name: 'playerOne')
      @name = name
      @hand = Hand.new
    end


  end
end
