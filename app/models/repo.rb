require "rugged"
class Repo < ApplicationRecord
  belongs_to :user
  validates :slug, presence: true, uniqueness: { scope: :user_id }
  after_initialize :create_repo

  private

  def create_repo
    Rugged::Repository.init_at("#{RepoManager::Config::REPOS_ROOT}/#{user.slug}/#{slug}")
  end
end
