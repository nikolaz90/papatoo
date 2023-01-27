class SpellThisController < ApplicationController
  def index
    policy_scope(:spell_this)
  end
end
