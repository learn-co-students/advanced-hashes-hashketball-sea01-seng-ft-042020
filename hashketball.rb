# Write your code here
require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => [ "Black", "White" ],
      :players => [ 
        { :player_name => "Alan Anderson" , :number => 0 , :shoe => 16 , :points => 22 , :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        { :player_name => "Reggie Evans" , :number => 30 , :shoe => 14 , :points => 12 , :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        { :player_name => "Brook Lopez" , :number => 11 , :shoe => 17 , :points => 17 , :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        { :player_name => "Mason Plumlee" , :number => 1 , :shoe => 19 , :points => 26 , :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        { :player_name => "Jason Terry" , :number => 31 , :shoe => 15 , :points => 19 , :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
          ]
    }, :away => {
      :team_name => "Charlotte Hornets",
      :colors => [ "Turquoise", "Purple" ],
      :players => [
        { :player_name => "Jeff Adrien" , :number => 4 , :shoe => 18 , :points => 10 , :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        { :player_name => "Bismack Biyombo" , :number => 0 , :shoe => 16 , :points => 12 , :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        { :player_name => "DeSagna Diop" , :number => 2 , :shoe => 14 , :points => 24 , :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        { :player_name => "Ben Gordon" , :number => 8 , :shoe => 15 , :points => 33 , :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        { :player_name => "Kemba Walker" , :number => 33 , :shoe => 15 , :points => 6 , :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}        
          ]
    }
  }
  game
end

def num_points_scored(name)
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      if player[:player_name] == name 
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      if player[:player_name] == name 
        return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do | which_team , team_attr |
    if team_attr[:team_name] == team 
      return team_attr[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do | which_team , team_attr |
    teams << team_attr[:team_name]
  end
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do | which_team , team_attr |
    if team_attr[:team_name] == team
      team_attr[:players].each do | player |
        numbers << player[:number] 
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      # binding.pry
      if player[:player_name] == name 
        player.shift
        return player
      end
    end
  end
end

def big_shoe_rebounds
  all_shoes = []
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      all_shoes << player[:shoe] 
    end
  end
  biggest_shoe_size =  all_shoes.sort[-1]
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      if player[:shoe] == biggest_shoe_size 
        return player[:rebounds]
      end
    end
  end
end

def most_points_scored
  all_points = []
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      all_points << player[:points] 
    end
  end
  most_points =  all_points.sort[-1]
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      if player[:points] == most_points 
        return player[:player_name]
      end
    end
  end
end

def winning_team
  home_points = []
  away_points = []
  game_hash[:home][:players].each do | player |
      home_points << player[:points] 
    end
  game_hash[:away][:players].each do | player |
      away_points << player[:points] 
    end
  total_home = 0
  total_away = 0
  home_points.each do |num| 
    total_home += num
  end
  away_points.each do |num|
    total_away += num
  end
  if total_home > total_away
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  all_names = []
  length = 0
  all_lengths = []
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      all_names << player[:player_name] 
    end
  end
  all_names.each do | name | 
    while name.length > length do
      length = name.length
    end
    all_lengths << name.length
  end
  return all_names[all_lengths.find_index(length)]
end

def long_name_steals_a_ton?
  all_names = []
  all_steals = []
  
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      all_names << player[:player_name] 
    end
  end
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      all_steals << player[:steals] 
    end
  end
  
  most_steals = all_steals.sort[-1]
  most_steals_player = "Nobody"
  
  game_hash.each do | which_team , team_attr |
    team_attr[:players].each do | player |
      if player[:steals] == most_steals
        most_steals_player = player[:player_name]
      end
    end
  end
  
  length = 0
  all_lengths = []
  
  all_names.each do | name | 
    while name.length > length do
      length = name.length
    end
    all_lengths << name.length
  end
  
  all_names[all_lengths.find_index(length)] == most_steals_player
end