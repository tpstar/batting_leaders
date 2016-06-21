require 'open-uri'
require 'nokogiri'
# require 'pry'


class BattingLeaders::Player
  attr_accessor :name, :batting_ave, :url
  @@all = []

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
    self.batting_leaders.sort_by {|player| player.batting_ave}.reverse! #sort by attribute (batting_ave) of Player's instance
  end

  def self.batting_leaders
    self.row_scraper("odd")
    self.row_scraper("even")
    self.all
  end

  def self.row_scraper(oddEven)
    oddEven =="odd" ? odd_or_even_row = "oddrow" : odd_or_even_row = "evenrow"
    get_page = Nokogiri::HTML(open"http://espn.go.com/mlb/stats/batting/_/year/2016/seasontype/2")

    get_page.css("tr.#{odd_or_even_row}").collect do |player|
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

  def number_position
    @number_position ||= doc.css(".general-info .first").text
  end

  def team
    @team ||= doc.css(".general-info .last").text
  end

  def birth_date
    @birth_date ||= doc.css(".player-metadata li")[0].text.gsub("Birth Date", "")
  end

  def experience
    @experience ||= doc.css(".player-metadata li")[2].text.gsub("Experience", "")
  end

  def college
    @college ||= doc.css(".player-metadata li")[3].text.gsub("College", "")
  end

  def ht_wt
    @ht_wt ||= doc.css(".player-metadata li")[4].text.gsub("Ht/Wt", "")
  end

  def homerun
    @homerun ||= doc.css(".header-stats td")[1].text
  end

  def rbi
    @rbi ||= doc.css(".header-stats td")[2].text
  end

  def obp
    @obp ||= doc.css(".header-stats td")[3].text
  end

end
