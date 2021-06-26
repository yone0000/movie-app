class MessagesController < ApplicationController
  # def new
  #   @messages = Message.all
  #   @message = Message.new
  # end

  def create
    # @article = article.find(params[:aritcle_id])
    # @message = @article.messages.new(message_params)
    # if @message.save
    #   if @messages.save
    #     redirect_to article_messages_path(@article)
    #   else
    #     @messages = @room.messages.includes(:user)
    #     render :index
    #   end
      @message = Message.create(message_params)
      # binding.pry
    redirect_to "/articles/#{@message.article.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
  end
