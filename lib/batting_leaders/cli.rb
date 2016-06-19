class BattingLeaders::CLI
  def call
    @sorted_leading_batters = BattingLeaders::Player.sorted_batters
    list_players
    menu
  end

  def list_players
    puts "List of top MLB players today for batting average:"
    puts ""
    puts "Select a number of players displayed (10, 20, 30, or 40)"
    puts ""
    display_list
  end

  def display_list
    number_players = gets.strip.to_i
    if number_players == 10 || number_players == 20 || number_players == 30 || number_players == 40
      puts "   Player                      batting ave"
      @sorted_leading_batters[0,number_players].each_with_index do |player, index|
        printf("%-3s", "#{index + 1}:")
        printf("%-27s", "#{player.name}")
        puts "#{player.batting_ave}"
      end
    else
      puts "invalid input, please type (10, 20, 30, or 40)"
      display_list
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the player you'd like more info on, type list to see the list again or type exit."
      input = gets.strip.downcase
      if (input.to_i > 0) && (input.to_i < 41)
        player_url = @sorted_leading_batters[input.to_i - 1].url
        player_profile(player_url)
      elsif input == "list"
        list_players
      elsif input == "exit"
        goodbye
      else
        puts "invalid input, please type again (1 .. 40), list, or exit"
      end
    end
  end

  def player_profile(player_url)
    player = BattingLeaders::Player.find_player_by_url(player_url)
    puts "name #{player.name}"
    puts "batting ave #{player.batting_ave}"
    puts "number and position: #{player.number_position}"
    puts "team: #{player.team}"
    puts "birth date: #{player.birth_date}"
    puts "experience: #{player.experience}"
    puts "college: #{player.college}"
    puts "Ht/Wt: #{player.ht_wt}"
  end

  def goodbye
    puts "Check again soon!"
  end

end
