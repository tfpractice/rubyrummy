include Rummy
describe SuitPlay do
  let(:my3s) { Card.new(3, 'Spades') }
  let(:my4s) { Card.new(4, 'Spades') }
  let(:my5s) { Card.new(5, 'Spades') }
  let(:my4d) { Card.new(4, 'Diamonds') }


  let(:myPlay) { SuitPlay.new([my3s, my4s, my5s]) }

  # let(:my3s) { Card.new(3, 'Spades') }
  let(:my3h) { Card.new(3, 'Hearts') }
  let(:my3d) { Card.new(3, 'Diamonds') }
  # let(:my4s) { Card.new(4, 'Spades') }
  # let(:myPlay) { RankPlay.new([my3s, my3h, my3d]) }
  it 'inherits from RubyCards::Hand' do
    expect(SuitPlay.superclass).to eq(RubyCards::Hand)
  end
  describe '#initialize' do
    context 'when given threee cards of equal suit' do
      it 'returns a new play' do
        expect(myPlay).to be_a_kind_of(SuitPlay)
      end
    end
    context 'when given three cards of different suit' do
      it 'raises a RuntimeError' do
        expect { SuitPlay.new([my3s, my3h, my4s]) } .to raise_error(RuntimeError)
      end
    end
  end
  describe '#consecutive?' do
    it 'checks if all the cards are consecutive' do
      expect(myPlay.consecutive?(myPlay.cards)).to eq(true)
    end
  end
  it 'has three cards' do
    expect(myPlay.cards.length).to eq(3)
  end
end
