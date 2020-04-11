# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(name)
  gamehash = game_hash
  gamehash.each do |key1, value1|
    value1[:players].each do |value2|
      if value2[:player_name] == name
        return value2[:points]
      end
    end
  end
  return nil
end

def shoe_size(name)
  gamehash = game_hash
  gamehash.each do |key1, value1|
    value1[:players].each do |value2|
      if value2[:player_name] == name
        return value2[:shoe]
      end
    end
  end
  return nil
end

def team_colors(name)
  gamehash = game_hash
  gamehash.each do |key1, value1|
    if value1[:team_name] == name
      return value1[:colors]
    end
  end
  return nil
end

def team_names
  gamehash = game_hash
  names = []
  gamehash.each do |key1, value1|
    names.push(value1[:team_name])
  end
  return names
end

def player_numbers(name)
  gamehash = game_hash
  numbers = []
  gamehash.each do |key1, value1|
    if value1[:team_name] == name
      value1[:players].each do |value2|
        numbers.push(value2[:number])
      end
    end
  end
  return numbers
end

def player_stats(name)
  gamehash = game_hash
  player_info = {}
  gamehash.each do |key1, value1|
    value1[:players].each do |value2|
      if value2[:player_name] == name
        return value2
      end
    end
  end
  return nil
end

def big_shoe_rebounds
  gamehash = game_hash
  player_info = {}
  gamehash.each do |key1, value1|
    value1[:players].each do |value2|
      if player_info == {}
        player_info = value2
      end
      if player_info[:shoe] < value2[:shoe]
        player_info = value2
      end
    end
  end
  return player_info[:rebounds]
end