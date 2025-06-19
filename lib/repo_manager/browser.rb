# frozen_string_literal: true

module RepoManager
  class Browser

    def initialize
      @repos_root = RepoManager::Config::ROOT_PATH
    end

    def list_content(user_slug:, repo_slug:)
      repo_path = @repos_root.join(user_slug.to_s).join(repo_slug.to_s).to_s
      entries = Dir.entries(repo_path)

      files = entries.select { |entry| File.file?(File.join(repo_path, entry)) }
      dirs  = entries.select { |entry| File.directory?(File.join(repo_path, entry)) }

      {
        dirs: dirs,
        files: files
      }
    end


    private

  end
end
