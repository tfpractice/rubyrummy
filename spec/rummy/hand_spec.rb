include Rummy

describe Hand do
  let(:myHand) { Hand.new }
  let(:specDeck) { MainDeck.new }

  it 'inherits from RubyCards::Hand' do
    expect(Hand.superclass).to eq(RubyCards::Hand)
  end
  describe '#delegators' do
    it 'delegates size to @cards' do
      expect(myHand).to respond_to(:size)
    end
  end
  context 'when hand has cards' do
    before(:each) do
      specDeck.shuffle!
      myHand.draw(specDeck, 10)
    end
    describe '#select_card' do
      it 'returns the card specified by rank and suit' do
        r0 = myHand[0].rank
        s0 = myHand[0].suit
        expect(myHand.select_card(r0,s0)).to be_a_kind_of(Card)
      end
    end
    describe '#select_by_rank' do
      it 'returns all the cards in hand of the matching rank' do
        r0 = myHand[0].rank
        puts myHand.select_by_rank(r0)
        expect(myHand.select_by_rank(r0)).to be_a_kind_of(Array)
      end
    end
    describe '#select_by_suit' do
      it 'returns all the cards in hand of the matching rank' do
        s0 = myHand[0].suit
        puts myHand.select_by_suit(s0)
        expect(myHand.select_by_suit(s0)).to be_a_kind_of(Array)
      end
    end
    describe '#discard' do
      it 'reduces cards by 1' do
        puts myHand
        c1 = myHand[1]
        myHand.discard(c1)
        puts myHand
        expect(myHand).not_to include(c1)


      end
    end
  end

  #
  # end
end