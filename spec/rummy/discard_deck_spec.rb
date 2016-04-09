include Rummy

describe DiscardDeck do
  it 'inherits from Rummy::Deck' do
    expect(DiscardDeck.superclass).to eq(Rummy::Deck)
  end
end
