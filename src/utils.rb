require "fileutils"

class Utils
  class << self
    DOTFILES_ROOT = File.expand_path "..", __dir__

    def exec(command)
      raise "Failed to execute command: #{command}" unless system command
    end

    # @return [String]
    def run(command)
      `#{command}`
    end

    def create_symlink(from, to = nil)
      unless to.nil?
        absolute_to = File.expand_path to
        FileUtils.rm_rf absolute_to

        absolute_to_dir = File.dirname absolute_to
        FileUtils.mkdir_p absolute_to_dir
      end

      file_name = File.basename from
      to ||= "~/#{file_name}"
      absolute_from = File.expand_path from, DOTFILES_ROOT
      command = "ln -sf #{absolute_from} #{to}"
      exec command
    end

    def git_clone(path:, url:)
      return true if File.exist? File.expand_path(path)

      exec "git clone --recursive #{url} #{path}"
    end

    def apt_install(package_name)
      exec "sudo apt install -y #{package_name}" if linux?
    end

    def brew_install(package_name, cask: false)
      return unless macos?

      cask_option_str = cask ? "--cask" : ""
      exec "brew install #{cask_option_str} #{package_name}"
    end

    def auto_install(package_name, cask: false)
      if linux?
        apt_install package_name
      else
        brew_install package_name, cask: cask
      end
    end

    def linux?
      system "uname -s | grep -i linux"
    end

    def macos?
      system "uname -s | grep -i darwin"
    end

    def wsl?
      system "uname -r | grep -i microsoft"
    end

    def windows_user_name
      run("cmd.exe /c echo %USERNAME%").strip
    end

    def windows_home_dir
      File.join "/", "mnt", "c", "Users", windows_user_name
    end

    def windows_appdata_dir
      File.join windows_home_dir, "AppData", "Roaming"
    end

    def download_file(url)
      exec "curl -LO #{url}"
    end

    def command_exists?(command)
      system "command -v #{command} > /dev/null 2>&1"
    end

    def editor_nvim?
      exec "echo $EDITOR" == "nvim"
    end

    def editor_code?
      exec "echo $EDITOR" == "code"
    end
  end
end
