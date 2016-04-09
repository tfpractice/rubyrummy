
include Rummy
describe Card do
  let(:myCard) { Card.new() }
  let(:my2S) { Card.new(2, 'Spades') }
  let(:myKS) { Card.new('King', 'Spades') }
  it 'has a rank' do
    expect(myCard.rank).to eq('Ace')
  end
  describe '#pred' do
    it 'returns the preceding rank' do
      expect(myCard.pred).to eq('King')
    end

  end
  describe '#succ' do
    it 'returns the successive rank' do
      expect(myCard.succ).to eq(2)
    end
  end

end
