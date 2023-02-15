class ConvosController < ApplicationController
  def index
    @convos = policy_scope(Convo)
  end

  def create
    @convo = Convo.new(sender: current_user)
    @receiver = User.find(params[:receiver])
    @convo.receiver = @receiver
    authorize @convo
    if @convo.save
      redirect_to convo_messages_path(@convo)
    end
  end
end
