class GameScore < ApplicationRecord
  belongs_to :user

  def self.top_3_scorers(game_name)
    includes(:user).where(game_name: game_name).order("score DESC").first(3)
  end
end
