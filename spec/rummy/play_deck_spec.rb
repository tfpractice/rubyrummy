include Rummy
describe PlayDeck do
  it 'inherits from Rummy::Deck' do
    expect(PlayDeck.superclass).to eq(Rummy::Deck)
  end
end
