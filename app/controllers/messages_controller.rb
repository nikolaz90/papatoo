class MessagesController < ApplicationController
  before_action :find_convo, only: %i[index create]

  def index
    unless @convo.sender == current_user || @convo.receiver == current_user
      redirect_to convos_path, notice: "Probably not you convo. Access denied."
    end
    @messages = @convo.messages
    @message = Message.new
    policy_scope(Message)
  end

  def create
    @message = Message.create(message_params)
    @message.user = current_user
    @message.convo = @convo
    if @message.save
      redirect_to convo_messages_path(@convo)
    else
      render :index
    end
    authorize @message
  end

  private

  def find_convo
    @convo = Convo.find(params[:convo_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
