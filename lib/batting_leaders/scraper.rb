require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open"http://espn.go.com/mlb/stats/batting/_/year/2016/seasontype/2")
  end

  def row_scraper(oddEven)

    oddEven =="odd" ? odd_or_even_row = "oddrow" : odd_or_even_row = "evenrow"
    self.get_page.css("tr.#{odd_or_even_row}").collect do |player|
      player_attributes = {:name => player.css("a").text,
                           :player_url => player.css("a").attribute("href").value,
                           :batting_ave => player.css(".sortcell").text}
      player = Player.new(player_attributes)
      player_attributes
    end
  end

  def self.print_battingleaders(numb)
    odd_row_players = row_scraper("odd")
    even_row_players = row_scraper("even")
    i = 1
    until i > (numb/2)
      printf("%-4s", "#{i*2 -1}:")
      printf("%-27s", "#{odd_row_players[i-1][:name]}")
      puts "#{odd_row_players[i-1][:batting_ave]}"
      printf("%-4s", "#{i*2}:")
      printf("%-27s", "#{even_row_players[i-1][:name]}")
      puts "#{even_row_players[i-1][:batting_ave]}"
      i += 1
    end
  end

  def scrape_player_page(player_url)

  end

end #class Scraper


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
