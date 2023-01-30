class GameScore < ApplicationRecord
  belongs_to :user

  def self.top_3_scorers(game_name)
    where(game_name: game_name).order("score DESC").includes(:user).first(3)
  end
end
