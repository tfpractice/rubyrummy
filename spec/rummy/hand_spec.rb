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
        expect(myHand.select_by_rank(r0)).to be_a_kind_of(Array)
      end
    end
    describe '#select_by_suit' do
      it 'returns all the cards in hand of the matching rank' do
        s0 = myHand[0].suit
        expect(myHand.select_by_suit(s0)).to be_a_kind_of(Array)
      end
    end
    describe '#discard' do
      it 'reduces cards by 1' do
        c1 = myHand[1]
        myHand.discard(c1)
        expect(myHand).not_to include(c1)
      end
    end
    describe '#rank_triplets' do
      it 'returns each of the triplets in hand' do
        puts myHand.rank_triplets()
        expect(myHand.rank_triplets).to be_a_kind_of(Hash)
      end
    end
    describe '#group_by_rank' do
      it 'returns the hash of arrays with ranks as keys' do
        puts myHand.group_by_rank
        expect(myHand.group_by_rank).to be_a_kind_of(Hash)
      end
    end
    describe '#group_by_suit' do
      it 'returns a hash of all the available suits and asociated cards' do
        puts myHand.group_by_suit
        expect(myHand.group_by_suit).to be_a_kind_of(Hash)
      end
    end
    describe '#ranks' do
      it 'returns an array of all the ranks in hand' do
        expect(myHand.ranks).to be_a_kind_of(Array)
      end
    end
    describe '#suits' do
      it 'returns an array of all the suits in hand' do
        expect(myHand.suits).to be_a_kind_of(Array)
      end
    end
    describe '#suit_consecutives' do
      it 'returns any of the suit-groups that contain conseuctive cards' do
        p myHand.suit_consecutives
        expect(myHand.suit_consecutives).to be_a_kind_of(Hash)
      end
    end
    describe '#get_neighbors' do
      context 'when hand holds three sequential cards of a suit' do
        before(:each) do
          @s_a = Card.new('Ace', 'Spades')
          @s_2 = Card.new(2, 'Spades')
          @s_3 = Card.new(3, 'Spades')
          myHand.cards.push(@s_3)
          myHand.cards.push(@s_a)
          myHand.cards.push(@s_2)
        end
        it 'contains a 2 of spades' do
          expect(myHand.cards).to include(@s_2)
        end
        it 'contains a Ace of spades' do
          expect(myHand.cards).to include(@s_a)
        end
        it 'contains a 3 of spades' do
          expect(myHand.cards).to include(@s_3)
        end
        it 'returns the arguments immediate neighboring cards in hand' do
          # c0 = myHand.cards[0]
          # puts @s_2
          p myHand.get_neighbors(@s_2).class
          expect(myHand.get_neighbors(@s_2)).to be_a_kind_of(Array)
        end
      end
    end
  end
end
