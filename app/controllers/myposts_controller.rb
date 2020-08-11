class MypostsController < ApplicationController

  def index
    @mypost = Mypost.all
  end

  def new
    @mypost = Mypost.new
  end

  def create

  end
end
