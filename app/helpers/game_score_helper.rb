module GameScoreHelper
  def top_3_scorers_message(top_3)
    return "Top scorer is : Nobody has won this game yet...." if top_3.empty?

    if top_3.length == 1
      return "Top scorer is : N°1 #{top_3.first.user.username} score -> #{top_3.first.score}"
    elsif top_3.length == 2
      return sanitize "Top scorers are : <br/>
                       N°1 #{top_3.first.user.username} score -> #{top_3.first.score} <br/>
                       N°2 #{top_3.second.user.username} score -> #{top_3.second.score}"
    else
      sanitize "Top scorers are : <br/>
                N°1 #{top_3.first.user.username} score -> #{top_3.first.score} <br/>
                N°2 #{top_3.second.user.username} score -> #{top_3.second.score} <br/>
                N°3 #{top_3.last.user.username} score -> #{top_3.last.score}"

    end
  end
end
