class Api::V1::ReposController < ApplicationController
  before_action :set_repo, only: %i[ show update destroy ]

  # GET /api/v1/repos
  def index
    @repos = Repo.all

    render json: @repos
  end

  # GET /api/v1/repos/1
  def show
    render json: @repo
  end

  # POST /api/v1/repos
  def create
    @repo = Repo.new(repo_params)

    if @repo.save
      render json: @repo, status: :created, location: @repo
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/repos/1
  def update
    if @repo.update(repo_params)
      render json: @repo
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/repos/1
  def destroy
    @repo.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repo
      @repo = Repo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def repo_params
      params.fetch(:repo, {})
    end
end
