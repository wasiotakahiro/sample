class TwittersController < ApplicationController
    before_action :set_twitter, only: [:show, :edit, :update, :destroy]
  def index
    @twitters = Twitter.all
  end

  def new
    if params[:back]
      @twitter = Twitter.new(blog_params)
    else
      @twitter = Twitter.new
    end
  end

  def create
    @twitter = Twitter.new(twitter_params)
    if @twitter.save
      redirect_to twitters_path, notice: "ツイートを作成しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def show
   @twitter = Twitter.find(params[:id])
end
def update
    if @twitter.update(twitter_params)
      redirect_to twitters_path, notice: "ツイートを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @twitter.destroy
    redirect_to twitters_path, notice:"ツイートを削除しました！"
  end

  private
    def twitter_params
      params.require(:twitter).permit(:content)
    end

    def set_twitter
      @twitter = Twitter.find(params[:id])
    end
end
