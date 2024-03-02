require "English"

# This class is a command generator used by zshrc's f command.
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
        gd: Edit a file in git diff.
        gg QUERY: Edit a file in git grep.
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

  def gd
    edit run_fzf("git diff HEAD --name-only")
  end

  def gg
    raise "No query given" if @query.empty?

    res = run_fzf "git grep --line-number #{@query}"
    file, line = res.split ":"
    edit "+#{line} #{file}"
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
    res
  end

  def editor = ENV["EDITOR"] || "vim"

  def edit(file)
    "#{editor} #{file}"
  end

  def cd(dir)
    "cd #{dir}"
  end
end

puts FzfCommandGenerator.new(ARGV).send(:generate_command)
