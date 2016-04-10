# require 'spec_helper'

include Rummy
describe Player do
  let(:myPlayer) { Player.new(name: 'tfpractice') }
  let(:opponent) { Player.new(name: 'opponent') }
  let!(:myGame) { Game.new(players: [myPlayer, opponent]) }
  let(:myDeck) { MainDeck.new }
  let(:defGame) { Game.new }

  describe '#initialize' do
    context 'with no params' do
      it 'returns player with @name set to playerOne' do
        newPlayer = Player.new
        expect(newPlayer.name).to eq('playerOne')
      end
      it 'retuns a player with an empty hand' do
        newPlayer = Player.new
        expect(newPlayer.hand).to be_a_kind_of(Hand)
      end
    end
  end
  it 'extends Forwardable' do
    expect(Player.singleton_class.included_modules).to include(Forwardable)
  end
  it 'includes :@game in its instance_variables' do
    expect(myPlayer.instance_variables).to include(:@game)
  end


  describe '#draw' do
    context 'before called' do
      describe "#hand" do
        it 'is empty' do
          expect(myPlayer.hand.cards.length).to eq(0)
        end
      end
    end
    context 'after called' do
      describe '#hand' do
        it 'contains 1 card' do
          expect { myPlayer.draw(myDeck, 1) }.to change{myPlayer.hand.cards.length}.by(1)
        end
      end
    end
  end
  describe '#discard' do
    before(:each) do
      myPlayer.draw(myDeck, 10)
    end
    describe '@hand' do
      it 'removes the specified card from hand' do
        c2 = myPlayer.hand[2]
        puts myPlayer.game
        myPlayer.discard(c2)
        expect(myPlayer.hand).not_to include(c2)
      end
    end
    describe 'discard_deck' do
      it 'adds the specified card to discard_deck' do
        c2 = myPlayer.hand[2]
        myPlayer.discard(c2)
        expect(myPlayer.discard_deck).to include(c2)
      end
    end
    # it 'reduces players hand by 1' do
    #
    # end
  end
end
