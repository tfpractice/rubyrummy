# require 'spec_helper'

include Rummy
describe Player do
  let(:myPlayer) { Player.new(name: 'tfpractice') }
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

end
