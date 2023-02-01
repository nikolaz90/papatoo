class SpellThisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    policy_scope(:spell_this)
    @top_3_scores = GameScore.top_3_scorers("spell this")
    @game_score = GameScore.new
  end
end
