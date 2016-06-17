class BattingLeaders::Player
  attr_accessor :name, :batting_ave, :player_url
  @@all = []

  def initialize(player_hash)
    @name = player_hash[:name]
    @location = player_hash[:batting_ave]
    @player_url = player_hash[:player_url]
    @@all << self
  end

  def self.all
#    @@all
    puts "List of top MLB current players for batting average:"
    puts ""
    #    puts "Select a number of players displayed (10, 20, 30, or 40)"
    puts ""
    puts "   Player                      batting ave"
    puts "1. Daniel Murphy               .359"
    puts "2. Xander Bogaerts             .358"
  end
end

# binding.pry
