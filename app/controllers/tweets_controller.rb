class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index]
  before_action :set_tweet, only: [:edit, :update, :destroy, :show]
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("id DESC")
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
    redirect_to root_path
  end

  def destroy
    @tweet.destroy 
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet).merge(user_id: current_user.id)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


