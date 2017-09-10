require 'open-uri'
require 'nokogiri'
require 'pry'


class BattingLeaders::Player
  attr_accessor :name, :batting_ave, :url
  @@all = []

  PlayerDetails = {
  #  @team => ".general-info .last"
    team: [".general-info .last", 0, ""],
    number_position: [".general-info .first", 0, ""],
    birth_date: [".player-metadata li", 0, "Birth Date"],
    homerun: [".header-stats td", 1, ""],
    experience: [".player-metadata li", 2, "Experience"],
    college: [".player-metadata li", 3, "College"],
    ht_wt: [".player-metadata li", 4, "Ht/Wt"],
    rbi: [".header-stats td", 2, ""],
    obp: [".header-stats td", 3, ""]
  }

  def initialize(player_hash)
    @name = player_hash[:name]
    @batting_ave = player_hash[:batting_ave]
    @url = player_hash[:url]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.sorted_batters
    self.batting_leaders.sort {|player, player2| player2.batting_ave <=> player.batting_ave} #sort by attribute (batting_ave) of Player's instance
  end

  def self.batting_leaders
#    oddEven =="odd" ? odd_or_even_row = "oddrow" : odd_or_even_row = "evenrow"
    current_year = Date.today.year
    get_page = Nokogiri::HTML(open"http://espn.go.com/mlb/stats/batting/_/#{current_year}/2016/seasontype/2")
    get_page.css("tr.oddrow,.evenrow").collect do |player|
      player_attributes = {:name => player.css("a").text,
                           :url => player.css("a").attribute("href").value,
                           :batting_ave => player.css(".sortcell").text}
      player = self.new(player_attributes)
    end
  end

  def self.find_player_by_url(player_url)
    @@all.detect{|player| player.url == player_url}
  end

  def doc
    @doc ||= Nokogiri::HTML(open"#{@url}").css(".mod-content")
  end

  def other_details
    player_detail_hash = {}
    PlayerDetails.each do |attribute, values|  #values = ["css selector", index, "erased text using gsub" ]
      player_detail_hash[attribute] ||= doc.css(values[0])[values[1]].text.gsub(values[2], "")
    end
    player_detail_hash
  end

end
