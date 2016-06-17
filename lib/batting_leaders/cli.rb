class BattingLeaders::CLI

  def call
    list_players
    menu
  end

  def list_players
    BattingLeaders::Player.all
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the player you'd like more info on, type list to see the list again or type exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on player 1"
      when "2"
        puts "more infor on player 2"
      when "list"
        list_players
      when "exit"
        goodbye
      else
        puts "invalid input, please type again (1-20, list, or exit)"
      end
    end
  end


  def goodbye
    puts "Check again soon!"
  end

end
