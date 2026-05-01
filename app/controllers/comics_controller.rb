class ComicsController < ApplicationController
  before_action :set_comic, only: %i[ show edit update destroy ]
  
  def index
      @comics = Comic.all
  end

  def show
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to @comic
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comic.update(comic_params)
      redirect_to @comic
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comic.destroy
    redirect_to comics_path
  end

  private
    def set_comic
      @comic = Comic.find(params[:id])
    end

  def comic_params
    params.require(:comic).permit(:name, :issue, :publish_date, :page_number, :image_url, :franchise_id)
  end
end
