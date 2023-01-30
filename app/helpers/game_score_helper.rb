module GameScoreHelper
  def top_3_scorers_message(game_name)
    top_3 = GameScore.top_3_scorers(game_name)
    return "Top scorer is : Nobody has played this game yet...." if top_3.empty?
    return "Top scorer is : N°1 #{top_3.first.user.username}" if top_3.length == 1
    return "Top scorers are : N°1 #{top_3.first.user.username} and N°2 #{top_3.second.user.username}" if top_3.length == 2

    "Top scorers are : N°1 #{top_3.first.user.username}, N°2 #{top_3.second.user.username} and N°3 #{top_3.last.user.username}"
  end
end
