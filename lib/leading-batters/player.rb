class Player
  attr_accessor :name, :batting_ave, :player_url
  @@all = []

  def initialize(player_hash)
    @name = player_hash[:name]
    @location = player_hash[:batting_ave]
    @player_url = player_hash[:player_url]
    @@all << self
  end

  def self.all
    @@all
  end
end

binding.pry