class FranchisesController < ApplicationController
  before_action :set_franchise, only: %i[ show edit update destroy ]

  def index
      @franchises = Franchise.all
  end

  def show
  end

  def new
    @franchise = Franchise.new
  end

  def create
    @franchise = Franchise.new(franchise_params)
    if @franchise.save
      redirect_to @franchise
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @franchise.update(franchise_params)
      redirect_to @franchise
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @franchise.destroy
    redirect_to franchises_path
  end

  private
    def set_franchise
      @franchise = Franchise.find(params[:id])
    end

    def franchise_params
      params.expect(franchise: [ :name ])
    end
end
