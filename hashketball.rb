require "pry"

def game_hash
hashketball = {:home => 
          {:team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"], 
            :players => [
              {
                :player_name => "Alan Anderson",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 22, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 3, 
                  :blocks => 1, 
                  :slam_dunks => 1
              },
              {
                :player_name => "Reggie Evans",
                  :number => 30, 
                  :shoe => 14, 
                  :points => 12, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 12, 
                  :blocks => 12, 
                  :slam_dunks => 7
              },
              {
                :player_name => "Brook Lopez",
                  :number => 11, 
                  :shoe => 17, 
                  :points => 17, 
                  :rebounds => 19, 
                  :assists => 10, 
                  :steals => 3, 
                  :blocks => 1, 
                  :slam_dunks => 15
              },
              {
                :player_name => "Mason Plumlee", 
                  :number => 1, 
                  :shoe => 19, 
                  :points => 26, 
                  :rebounds => 11, 
                  :assists => 6, 
                  :steals => 3, 
                  :blocks => 8, 
                  :slam_dunks => 5
              },
              {
                :player_name => "Jason Terry", 
                  :number => 31, 
                  :shoe => 15, 
                  :points => 19, 
                  :rebounds => 2, 
                  :assists => 2, 
                  :steals => 4, 
                  :blocks => 11, 
                  :slam_dunks => 1
              }]
            },
            :away => 
          {:team_name => "Charlotte Hornets", 
            :colors => ["Turquoise", "Purple"], 
            :players => [
              {
                :player_name => "Jeff Adrien",
                  :number => 4, 
                  :shoe => 18, 
                  :points => 10, 
                  :rebounds => 1, 
                  :assists => 1, 
                  :steals => 2, 
                  :blocks => 7, 
                  :slam_dunks => 2
              },
              {
                :player_name => "Bismack Biyombo",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 12, 
                  :rebounds => 4, 
                  :assists => 7, 
                  :steals =>22, 
                  :blocks => 15, 
                  :slam_dunks => 10
              },
              {
                :player_name => "DeSagna Diop",
                  :number => 2, 
                  :shoe => 14, 
                  :points => 24, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 4, 
                  :blocks => 5, 
                  :slam_dunks => 5
              },
              {
                :player_name => "Ben Gordon",
                  :number => 8, 
                  :shoe => 15, 
                  :points => 33, 
                  :rebounds => 3, 
                  :assists => 2, 
                  :steals => 1, 
                  :blocks => 1, 
                  :slam_dunks => 0
              },
              {
                :player_name => "Kemba Walker",
                  :number => 33, 
                  :shoe => 15, 
                  :points => 6, 
                  :rebounds => 12, 
                  :assists => 12, 
                  :steals => 7, 
                  :blocks => 5, 
                  :slam_dunks => 12
              }]
            }}
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
       if player_name == data[:player_name]
          return data[:points]
    end
  end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
       if player_name == data[:player_name]
          return data[:shoe]
    end
  end
  end
end

def team_colors(teamname)
  game_hash.each do |location, team_data|
    if teamname == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  teamnames = []
  teamnames << game_hash[:home][:team_name]
  teamnames << game_hash[:away][:team_name]
  teamnames
end

def player_numbers(teamname)
  home_numbers = []
  away_numbers = []
  if teamname == game_hash[:home][:team_name]
  game_hash[:home][:players].each do |home_player_data|
        home_numbers << home_player_data[:number]
  end
      return home_numbers
    end
   if teamname == game_hash[:away][:team_name]
  game_hash[:away][:players].each do |away_player_data|
        away_numbers << away_player_data[:number]
  end
  return away_numbers
  end
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if player_name == data[:player_name]
        data.delete(:player_name)
        return data
      end
  end
end
end

def big_shoe_rebounds
  biggest_shoe = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      biggest_shoe << data[:shoe]
    end
  end
  biggest_shoe = biggest_shoe.sort[-1]
  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:shoe] == biggest_shoe
        return data[:rebounds]
      end
    end
  end
end