class MypostsController < ApplicationController

  def index
    @mypost = Mypost.all
  end

  def new
    @mypost = Mypost.new
  end

  def create
    @mypost = Mypost.create(mypost_params)
    if @mypost.save
      redirect_to new_mypost_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show
    params[:id]
  end

  private

  def mypost_params
    params.require(:mypost).permit(:content, :created_at)
  end
end
