class ComicsController < ApplicationController
  before_action :require_login, except: [ :index, :show ]
  before_action :set_comic, only: [ :show, :edit, :update, :destroy ]


  def index
    if params[:query].present?
      @comics = Comic.search(params[:query]).order(:issue)
    else
      @comics = Comic.all
    end
  end

  def show
  end

  def new
    @comic = Comic.new
  end

  def create
    uploaded_file = params[:comic][:imageUrl]

    if uploaded_file
      result = Cloudinary::Uploader.upload(uploaded_file)
      image_url = result["secure_url"]
    end
    @comic = Comic.new(comic_params)
    @comic.imageUrl = image_url

    if @comic.save
      redirect_to @comic
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

def update
  uploaded_file = params[:comic][:imageUrl]

  if uploaded_file
    result = Cloudinary::Uploader.upload(uploaded_file)
    image_url = result["secure_url"]
    @comic.imageUrl = image_url
  end

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
    params.require(:comic).permit(:name, :issue, :publishData, :pageNumber, :franchise_id)
  end
end
