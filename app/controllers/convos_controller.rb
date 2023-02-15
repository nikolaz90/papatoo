class ConvosController < ApplicationController
  def index
    @convos = policy_scope(Convo)
  end
end
