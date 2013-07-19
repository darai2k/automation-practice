# -*- coding: utf-8 -*-
desc "Setup bundle and berks"
task :setup do
  base_dir = File.expand_path(File.dirname(__FILE__))
  chef_repo_dir = base_dir + "/chef-repo/"
  FileUtils.cd(base_dir)
  system("bundle install --path vendor/bundle")
  raise "Failed bundle install" unless $?.success?
  FileUtils.cd(chef_repo_dir)
  system("bundle exec berks install --path cookbooks")

  # Recreate .gitkeep because berks install delete .gitkeep
  FileUtils.touch(chef_repo_dir + "/cookbooks/.gitkeep")
end
