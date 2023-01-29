class SpellThisController < ApplicationController
  def index
    policy_scope(:spell_this)
    @top_scores = GameScore.top_3_scorers("spell this")
  end
end
