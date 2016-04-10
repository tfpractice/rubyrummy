include Rummy
describe SuitPlay do
  it 'inherits from RubyCards::Hand' do
    expect(SuitPlay.superclass).to eq(RubyCards::Hand)
  end
end
