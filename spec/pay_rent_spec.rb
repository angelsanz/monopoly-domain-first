require_relative 'spec_helper'

describe 'Pay Rent' do
  describe 'when landing on an owned property' do

    let(:rent) { 100 }
    let(:players) { [
        TestPlayer.rich_about_to_land_in_a_property, 
        TestPlayer.rich_about_to_land_in_a_property
      ]
    }
    let(:game) { Game.new(*players) }

    it 'the tenant pay the rent' do
      owner = game.next_turn
      tenant = players.find { |player| !player.equal?(owner) }
      previous_tenant_balance = tenant.balance

      game.next_turn

      expect(tenant.balance).to eq(previous_tenant_balance - rent)
    end

    it 'the owner receives the rent' do
      owner = game.next_turn
      previous_owner_balance = owner.balance

      game.next_turn

      expect(owner.balance).to eq(previous_owner_balance + rent)
    end
  end
end