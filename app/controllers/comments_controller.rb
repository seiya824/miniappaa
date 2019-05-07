class CommentsController < ApplicationController

  
  def create
    @comment = Comment.create(create_params)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id]) }
      format.json
    end
  end

  private
  def create_params
    params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
