# lib/repo_manager/config.rb

require "pathname"
require "fileutils"

module RepoManager
  module Config
    REPOS_ROOT = ENV["REPOS_ROOT"].presence || Rails.root.join("repos").to_s
    ROOT_PATH = Pathname.new(REPOS_ROOT)

    def self.mk_repos_root
      FileUtils.mkdir_p(ROOT_PATH) unless ROOT_PATH.exist?
    end
  end
end
