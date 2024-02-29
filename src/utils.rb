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
      file_name = File.basename from
      to ||= "~/#{file_name}"
      absolute_from = File.expand_path from, DOTFILES_ROOT
      command = "ln -sf #{absolute_from} #{to}"
      exec command
    end

    def git_clone(path:, url:)
      return true if File.exist? path

      exec "git clone --recursive #{url} #{path}"
    end

    def apt_install(package_name)
      exec "sudo apt-get install -y #{package_name}"
    end

    def brew_install(package_name, cask: false)
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
      run "uname -s | grep -i linux"
    end

    def macos?
      run "uname -s | grep -i darwin"
    end
  end
end
