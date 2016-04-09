shared_examples_for('a deck')do

  describe '#draw' do
    it 'draws a single card from the deck' do
      first_card = deck.cards.first
      cards_expected_after_draw = deck.cards[1..-1]
      expect(deck.draw).to be_same_as first_card
      expect(deck.cards).to eq cards_expected_after_draw
    end
  end
  describe '#empty?' do
    context 'empty deck' do
      it 'returns true' do
        deck.cards.count.times { deck.draw }
        expect(deck).to be_empty
      end
    end
  end
  describe "#cut!" do
    context 'cutting the first card' do
      it 'returns itself' do
        expect(deck).to eq deck.cut!(0)
        should == deck.cut!(0)
      end
      it 'cuts the cards' do
        cards_before_cutting = deck.cards.dup
        deck.cut!(0)
        expect(deck.cards[0].suit).to eq cards_before_cutting[1].suit
        expect(deck.cards[0].rank).to eq cards_before_cutting[1].rank
        expect(deck.cards[-1].suit).to eq cards_before_cutting[0].suit
        expect(deck.cards[-1].rank).to eq cards_before_cutting[0].rank
      end
      it 'should return the same number of cards' do
        cards_before_cutting = deck.cards.dup
        deck.cut!(0)
        expect(deck.cards.count).to eq cards_before_cutting.count
      end
    end
    context 'cutting the second card' do
      it 'cuts the cards' do
        cards_before_cutting = deck.cards.dup
        deck.cut!(1)
        expect(deck.cards[0].suit).to eq cards_before_cutting[2].suit
        expect(deck.cards[0].rank).to eq cards_before_cutting[2].rank
        expect(deck.cards[-2].suit).to eq cards_before_cutting[0].suit
        expect(deck.cards[-2].rank).to eq cards_before_cutting[0].rank
        expect(deck.cards[-1].suit).to eq cards_before_cutting[1].suit
        expect(deck.cards[-1].rank).to eq cards_before_cutting[1].rank
      end
      it 'should return the same number of cards' do
        cards_before_cutting = deck.cards.dup
        deck.cut!(1)
        expect(deck.cards.count).to eq cards_before_cutting.count
      end
    end
  end

end
