require 'player'

describe Player do
  subject(:bob) { Player.new('Bob') }
  subject(:marley) { Player.new('Marley') }

  describe '#name' do
    it 'returns the name' do
      expect(bob.name).to eq('Bob')
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(bob.hit_points).to eq 100
    end
  end

  describe '#dead?' do
    it 'returns true if player is dead' do
      10.times{ bob.reduce_hp }
      expect(bob.dead?).to eq true
    end
  end

end