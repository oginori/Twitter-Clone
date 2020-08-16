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

  def edit
    @mypost = Mypost.find(params[:id])
  end

  def uptdate
    @mypost = Mypost.find(params[:id])
    if @mypost.update(mypost_params)
      redirect_to mypost_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  private

  def mypost_params
    params.require(:mypost).permit(:content, :created_at)
  end
end
