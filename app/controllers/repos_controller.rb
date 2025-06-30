class ReposController < ApplicationController
  before_action :set_repo, only: %i[ show update destroy tree ]
  before_action :set_user, only: %i[ index show  ]
  before_action :set_user_by_id, :authenticate_user!, only: %i[ create show ]

  def initialize
    super
    @repo_browser = RepoManager::Browser.new

  end

  def all
    render json: Repo.all
  end

  # GET /repos
  def index
    @repos = @user.repos
    render json: @repos
  end

  # GET /repos/1
  def show
    repo_content = @repo_browser.list_content(user_slug: @user.slug, repo_slug: @repo.slug)
    render json: repo_content
  end

  # POST /repos
  def create
    @repo = Repo.new(repo_params)

    if @repo.save
      render json: @repo, status: :created, location: user_repo_url(@user.slug, @repo.slug)
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /repos/1
  def update
    if @repo.update(repo_params)
      render json: @repo
    else
      render json: @repo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /repos/1
  def destroy
    @repo.destroy!
  end

  def tree
    repo_content = @repo_browser.list_content(recursive_path, user_slug: @user.slug, repo_slug: @repo.slug)
    render json: repo_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repo
      @repo = Repo.find_by_slug(params.expect(:repo_slug))
    end

  def set_user
    @user = User.find_by_slug(params.expect(:user_slug))
    # render json: { error: "Not Found" }, status: :not_found unless @user
  end
  def set_user_by_id
    @user = User.find(params[:repo][:user_id])
  end

    # Only allow a list of trusted parameters through.
    def repo_params
      params.expect(repo: [ :name, :slug, :user_id ])
    end
end
