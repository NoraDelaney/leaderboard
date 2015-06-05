require 'pry'

def game_info
   [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 7,
      away_score: 3
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 3,
      away_score: 0
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 11,
      away_score: 7
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 7,
      away_score: 21
    }
  ]
end

team_record = {
  "Patriots" => [0,0,0],
  "Steelers" => [0,0,0],
  "Colts" => [0,0,0],
  "Broncos" => [0,0,0]
}

game_info.each do |game|
  if game[:home_score] > game[:away_score]
    team_record[game[:home_team]][1] +=1
    team_record[game[:away_team]][2] +=1
  else
    team_record[game[:home_team]][2] +=1
    team_record[game[:away_team]][1] +=1
  end
end


ranking = team_record.sort_by{|team, scores| scores[1]}.reverse
# puts team_record

ranking.each_with_index do |(team, scores), index|
  team_record[team][0] = index +1

 end

ranking.each do |team, scores|
  puts "Team name: #{team}"
  puts "Ranking: #{scores[0]}"
  puts "Wins: #{scores[1]}"
  puts "Losses: #{scores[2]}"
end
