require "rugged"
class Repo < ApplicationRecord
  belongs_to :user
  validates :slug, presence: true, uniqueness: { scope: :user_id }
  after_initialize :create_repo

  def commits
    # Create a walker starting from the HEAD
    walker = Rugged::Walker.new(@git_repository)
    walker.sorting(Rugged::SORT_DATE)  # Optional: sort by date
    walker.push(@git_repository.head.target_id)   # Start from the latest commit

    commits = []
    # Iterate over all commits
    walker.each do |commit|
      commits << { id: commit.oid, author: commit.author[:name], date: commit.time, message: commit.message }
    end

    commits
  end

  private

  def create_repo
    Rugged::Repository.init_at("#{RepoManager::Config::REPOS_ROOT}/#{user.slug}/#{slug}")
    @git_repository = Rugged::Repository.new("#{RepoManager::Config::REPOS_ROOT}/#{user.slug}/#{slug}")
  end


end
