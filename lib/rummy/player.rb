# require_relative 'hand'

module Rummy
  class Player
    attr_accessor :hand, :name
    def initialize(name: 'playerOne')
      @name = name
      @hand = RubyCards::Hand.new
    end

  end
end