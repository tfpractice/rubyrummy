include Rummy
describe RankPlay do
  it 'inherits from RubyCards::Hand' do
    expect(RankPlay.superclass).to eq(RubyCards::Hand)
  end
end
