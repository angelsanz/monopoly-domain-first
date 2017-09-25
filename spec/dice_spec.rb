require_relative '../src/dice'

describe 'Dice' do
  it 'can be rolled' do
    dice = SixSidedDice.new

    expect(dice.roll()).to be_an(Integer)
  end
end