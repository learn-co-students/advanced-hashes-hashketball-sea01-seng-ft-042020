# Write your code here!
require 'pry'
def game_hash
    {
     :home => {
       :team_name => "Brooklyn Nets",
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
         }, {
           :player_name => "Reggie Evans",
           :number => 30,
           :shoe => 14,
           :points => 12,
           :rebounds => 12,
           :assists => 12,
           :steals => 12,
           :blocks => 12,
           :slam_dunks => 7
         }, {
           :player_name => "Brook Lopez",
           :number => 11,
           :shoe => 17,
           :points => 17,
           :rebounds => 19,
           :assists => 10,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 15
         }, {
           :player_name => "Mason Plumlee",
           :number => 1,
           :shoe => 19,
           :points => 26,
           :rebounds => 11,
           :assists => 6,
           :steals => 3,
           :blocks => 8,
           :slam_dunks => 5
         }, {
           :player_name => "Jason Terry",
           :number => 31,
           :shoe => 15,
           :points => 19,
           :rebounds => 2,
           :assists => 2,
           :steals => 4,
           :blocks => 11,
           :slam_dunks => 1
         }
       ]

 
      },
     :away => {
       :team_name => "Charlotte Hornets",
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
         }, {
           :player_name => "Bismack Biyombo",
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 22,
           :blocks => 15,
           :slam_dunks => 10
         }, {
           :player_name => "DeSagna Diop",
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5
         }, {
           :player_name => "Ben Gordon",
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         }, {
           :player_name => "Kemba Walker",
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 7,
           :blocks => 5,
           :slam_dunks => 12
         }
       ]
     }
   }
 end
 
def num_points_scored(player_name)
  #points stored in new empty array 
  points = []
  
  #goes through each piece of game_hash and looks for data in the #home/away nesting...
  game_hash.each do |h_a, info|
    #goes through each "players" key
    info[:players].each do |player|
      #if the player name matches
      if player[:player_name] == player_name
        #add the points to the points key
        points << player[:points]
      end 
    end
  end
  #returns points key
  points.join.to_f
end 

#new method created with player_name as the parameter 
def shoe_size(player_name)
  #new array named shoe_size created 
   shoe_size = []
   #in the game_hash method look at the home/away 
   game_hash.each do |h_a, info|
     #look to ":players" key 
     info[:players].each do |player|
       #if the key matches the player
       if player[:player_name] == player_name
         #add the shoe size to the new array
         shoe_size << player[:shoe]
       end
     end
   end
   #return new array - created a float to process the number
   shoe_size.join.to_f 
 end

def team_colors(team_name)
  color_team = []
  game_hash.each do |h_a, info|
    if info[:team_name] === team_name
    color_team.push(info[:colors])
  end
end
#flattens array into 2D
color_team.flatten
end 

def team_names
  hash = []
  game_hash.each do |h_a, info|
    hash << info[:team_name]
end
hash
end 

def player_numbers(team_name)
  #new array created 
num_array = []
#game_hash method called upon - using home/away data 
game_hash.each do |h_a, info|
  #if the entered name matches a team on file 
  if info[:team_name] == team_name
    #look at each players key
     info[:players].each do |player|
       #add that number to the new array 
      num_array << player[:number]
end
end 
end
#return new array
num_array
end 

def player_stats(player_name)
  #new empty hash 
  stats = {}
  #first level 
  game_hash.each do |h_a, info|
    #second level 
     info.each do |team, players|
       #third and final level - found "players"
       info[:players].each do |player|
         #if the parameter matches the key 
     if player[:player_name] == player_name
       #place key/value pairs in new hash 
       stats = player.select do |k,v|
       #do not include player_name key
         k != :player_name
     end
   end
 end
 end
end 
#return new hash 
stats
end 

def big_shoe_rebounds
  #just returning a number
  most_rebounds = ""
  #first level 
  game_hash.each do |h_a, info|
    #second level
      info.each do |team, players|
        #third and final level 
    info[:players].each do |player|
      #if the player shoe size is 19...
      if player[:shoe] === 19
        #take the value of the rebounds and return the statement
    most_rebounds =  player[:rebounds]
      end 
    end 
  end 
end 
    most_rebounds
end 