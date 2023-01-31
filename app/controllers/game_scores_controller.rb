class GameScoresController < ApplicationController
  def create
    @game_score = GameScore.new(game_score_params)
    @game_score.user = current_user
    @game_score.save
    redirect_to games_path
    authorize @game_score
  end

  private

  def game_score_params
    params.require(:game_score).permit(:game_name, :score)
  end
end
