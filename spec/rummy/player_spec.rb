# require 'spec_helper'

include Rummy
describe Player do
  let(:myPlayer) { Player.new(name: 'tfpractice') }
  let(:opponent) { Player.new(name: 'opponent') }
  let(:myGame) { Game.new(players: [myPlayer, opponent]) }
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

end
