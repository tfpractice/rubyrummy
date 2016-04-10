include Rummy
describe Game do
  let(:p1) { Player.new(name: 'p1') }
  let(:p2) { Player.new(name: 'p2') }
  let(:myGame) { Game.new(players: [p1, p2]) }
  let(:defGame) { Game.new }
  describe 'initialization' do
    context 'without params' do
      it 'creates two players' do
        expect(defGame.players.count).to eq(2)
      end
    end
    context 'with players' do
      it 'sets adds each player to @players' do
        expect(myGame.players).to include(p2)
      end
    end

    it 'has a @main_deck' do
      expect(myGame.instance_variables).to include(:@main_deck)
    end
    it 'has a @discard_deck' do
      expect(myGame.instance_variables).to include(:@discard_deck)
    end
    it 'has a @current_player' do
      expect(myGame.instance_variables).to include(:@current_player)
    end
  end

  describe '#switch_player' do
    context 'when current_player is p1' do
      it 'changes current_player through players' do
        currPlay = myGame.current_player
        myGame.switch_player
        expect(myGame.current_player).not_to eq(currPlay)
      end
    end
  end

  describe 'deal' do
    it 'deals 7 cards to each player' do
      myGame.deal
      expect(p1.hand.size).to eq(7)
    end
    it 'reduces @cards by 7*players.length' do
      expect { myGame.deal }.to change{myGame.main_deck.cards.length}.by(-14)
    end
  end
  describe '#play_decks' do
    it 'collects all of the players play decks' do
      puts myGame.play_decks
      expect(myGame.play_decks).to be_a_kind_of(Array)
    end
  end
end
