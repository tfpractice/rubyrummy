require_relative 'deck'
module Rummy

  class MainDeck < Deck
    # Initializes a standard deck of 52 cards
    # options:
    #   :number_decks
    #     eg. Deck.new(number_decks: 2)
    #     will create 2 decks standard decks of 52
    #   :exclude_rank
    #     eg. Deck.new(exclude_rank: [2,'Jack'])
    #     will exclude 8 cards of the 2 and Jack rank
    #
    # @return [Deck] A standard deck of cards
    def initialize(options={})
      @cards = []
      options[:exclude_rank] ||= []
      options[:number_decks] ||= 1

      options[:number_decks].times do
        (RANKS - options[:exclude_rank]).product(SUITS).each do |rank, suit|
          @cards << Card.new(rank, suit)
        end
      end
    end

    # Shuffles the deck and returns it
    #
    # @return [Deck] The shuffled deck
    def shuffle!
      @cards.shuffle!
      self
    end

    # Cuts the deck and returns it
    #
    # @param index [Integer] The index of the card that will be cut
    # @return [Deck] The cut deck
    def cut!(index)
      (0..index).each { @cards << @cards.shift }
      self
    end


  end
end
