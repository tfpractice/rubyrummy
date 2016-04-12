include Rummy
describe RankPlay do
  let(:my3s) { Card.new(3, 'Spades') }
  let(:my3h) { Card.new(3, 'Hearts') }
  let(:my3d) { Card.new(3, 'Diamonds') }
  let(:my4s) { Card.new(4, 'Spades') }
  let(:myPlay) { RankPlay.new([my3s, my3h, my3d]) }
  it 'inherits from RubyCards::Hand' do
    expect(RankPlay.superclass).to eq(RubyCards::Hand)
  end
  describe '#initialize' do
    context 'when given threee cards of equal rank' do
      it 'returns a new play' do
        expect(myPlay).to be_a_kind_of(RankPlay)
      end
    end
    context 'when given three cards of different rank' do
      it 'raises a RuntimeError' do
        expect { RankPlay.new([my3s, my3h, my4s]) } .to raise_error(RuntimeError)
      end
    end
  end
  it 'has three cards' do
    expect(myPlay.cards.length).to eq(3)
  end
end
