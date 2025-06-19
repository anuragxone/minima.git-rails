# set root repos path
require Rails.root.join("lib", "repo_manager", "config").to_s

RepoManager::Config.mk_repos_root
