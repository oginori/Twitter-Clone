class MypostsController < ApplicationController
  before_action :set_mypost, only: [:edit, :update, :destroy]
  def index
    @mypost = Mypost.all
  end

  def new
    @mypost = Mypost.new
  end

  def create
    @mypost = Mypost.new(mypost_params)
    if params[:back]
      render :new
    else
      if @mypost.save
        redirect_to myposts_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @mypost.update(mypost_params)
      redirect_to myposts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @mypost.destroy
    redirect_to myposts_path, notice: "削除しました！"
  end

  def confirm
    @mypost = Mypost.new(mypost_params)
    render :new if @mypost.invalid?
  end

  private

  def mypost_params
    params.require(:mypost).permit(:content, :created_at)
  end

  def set_mypost
    @mypost = Mypost.find(params[:id])
  end
end
