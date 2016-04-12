include Rummy
describe PlayDeck do
  let(:p1) { Player.new(name: 'p1') }
  let(:p2) { Player.new(name: 'p2') }
  let!(:myGame) { Game.new(players: [p1, p2]) }
  let(:myDeck) { p1.play_deck }
  it 'inherits from Rummy::Deck' do
    expect(PlayDeck.superclass).to eq(Rummy::Deck)
  end
  describe 'initialize' do
    it 'starts with an empty @plays array' do
      expect(myDeck.plays).to be_a_kind_of(Array)
    end
  end
end
