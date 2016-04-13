
include Rummy
describe Card do
  let(:myCard) { Card.new() }
  let(:my2S) { Card.new(2, 'Spades') }
  let(:myKS) { Card.new('King', 'Spades') }
  it 'has a rank' do
    expect(myCard.rank).to eq('Ace')
  end
  describe 'rank_id' do
    it 'returns the index of the cards rank within Deck::RANKS ' do
      expect(myCard.rank_id).to eq(12)
    end
  end
  describe '#pred_rank' do
    it 'returns the preceding rank' do
      expect(myCard.pred_rank).to eq('King')
    end
  end
  describe '#succ_rank' do
    it 'returns the succ_rankessive rank' do
      expect(myCard.succ_rank).to eq(2)
    end
  end

end
