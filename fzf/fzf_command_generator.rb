require "English"
require_relative "../src/utils"

# This class is a command generator used from fzf.zsh.
class FzfCommandGenerator
  def initialize(args)
    @options = args.select { |arg| arg.start_with? "-" }
    args -= @options

    @command = args.shift

    @query = args.join " "
  end

  def help
    text = <<~HELP
      Usage: f COMMAND [OPTIONS] [QUERY]
      Commands:
        help: Show this help.
        p: Edit a file.
        d: cd to a directory.
        dd: cd to a parent directory.
        gd: Edit a file in git diff.
        gg QUERY: Edit a file in git grep.
        ga: git add a file.
        gr: git reset a file.
      Options:
        -h, --help: Show this help.
    HELP

    "echo '#{text}'"
  end

  def p
    edit run_fzf("find . -type f")
  end

  def d
    cd run_fzf("find . -mindepth 1 -type d")
  end

  def dd
    current_dir = Dir.pwd
    parent_dirs = current_dir.split("/").map.with_index do |_, i|
      File.expand_path "../" * i, current_dir
    end[1..]
    cd run_fzf("echo '#{parent_dirs.join("\n")}'")
  end

  def gd
    edit run_fzf(all_changed_files_command(with_tracking: true))
  end

  def gg
    raise "No query given" if @query.empty?

    res = run_fzf "git grep --line-number #{@query}"
    file, line = res.split ":"
    if Utils.editor_code?
      edit "#{file}:#{line}"
    else
      edit "+#{line} #{file}"
    end
  end

  def ga
    git_add run_fzf(all_changed_files_command(with_tracking: false))
  end

  def gr
    git_reset run_fzf("git diff --name-only --relative --cached")
  end

  private

  # Public methods are commands.
  # If this method is public, it can be infinitely recursive.
  def generate_command
    if @command.nil? || @options.include?("-h") || @options.include?("--help")
      help
    else
      public_send @command
    end
  end

  def in_tmux? = system("tmux list-sessions > /dev/null 2>&1")

  def fzf_command = in_tmux? ? "fzf-tmux" : "fzf"

  def fzf_options = "--bind 'ctrl-k:kill-line' --query='#{@query}' --multi --select-1 --exit-0"

  def run_fzf(source_command)
    res = `#{source_command} | #{fzf_command} #{fzf_options}`
    exit 1 if res&.empty? || $CHILD_STATUS.exitstatus != 0
    res.chomp
  end

  def to_command(command)
    # Write to zsh history before executing the command.
    "print -s '#{command}' && #{command}"
  end

  def editor = ENV["EDITOR"] || "vim"

  def edit(file)
    to_command "#{editor} #{file}"
  end

  def cd(dir)
    to_command "cd #{dir}"
  end

  def all_changed_files_command(with_tracking:)
    "{ git diff #{with_tracking ? 'HEAD' : ''} --name-only --relative; git ls-files --others --exclude-standard; }"
  end

  def git_add(file)
    to_command "git add #{file}"
  end

  def git_reset(file)
    to_command "git reset #{file}"
  end
end

puts FzfCommandGenerator.new(ARGV).send(:generate_command)
