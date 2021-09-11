class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  # before_action :check_participating!, except: [:index]
  #所有私訊功能
  def index
    @conversations = Conversation.belonging(current_space).participating(current_user).order('updated_at DESC') 
  end

  def show
    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  # def check_participating!
  #   redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  # end

end