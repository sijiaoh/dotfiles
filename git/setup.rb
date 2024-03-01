if Utils.linux?
  Utils.exec "sudo curl --output /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo"
else
  Utils.brew_install "git-filter-repo"
end

Utils.auto_install "git-lfs"

def install_linux_delta
  delta_tar_name = "delta-0.16.5-x86_64-unknown-linux-musl.tar.gz"
  Utils.download_file "https://github.com/dandavison/delta/releases/download/0.16.5/delta-0.16.5-x86_64-unknown-linux-musl.tar.gz"
  Utils.exec "tar -xvf #{delta_tar_name}"

  delta_dir_name = File.basename delta_tar_name, ".tar.gz"
  Utils.exec "sudo mv #{File.join(delta_dir_name, 'delta')} /usr/local/bin"

  FileUtils.rm_rf delta_dir_name
  File.delete delta_tar_name
end

if Utils.linux?
  install_linux_delta unless Utils.command_exists? "delta"
else
  Utils.brew_install "git-delta"
end
